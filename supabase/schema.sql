create extension if not exists pgcrypto;

create table if not exists public.user_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  role text not null default 'editor' check (role in ('admin','editor')),
  created_at timestamptz not null default now()
);

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  icon text not null default '❓',
  name_en text not null,
  name_bn text not null,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.articles (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references public.categories(id) on delete cascade,
  title_en text not null,
  title_bn text not null,
  content_en text not null,
  content_bn text not null,
  keywords_en text not null default '',
  keywords_bn text not null default '',
  is_popular boolean not null default false,
  status text not null default 'published' check (status in ('draft','published','archived')),
  sort_order integer not null default 0,
  view_count bigint not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.announcements (
  id uuid primary key default gen_random_uuid(),
  title_en text not null,
  title_bn text not null,
  body_en text not null default '',
  body_bn text not null default '',
  level text not null default 'info' check (level in ('info','warning','critical','success')),
  starts_at timestamptz,
  ends_at timestamptz,
  is_active boolean not null default true,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.service_status (
  id uuid primary key default gen_random_uuid(),
  service_key text unique not null,
  label_en text not null,
  label_bn text not null,
  state text not null default 'normal' check (state in ('normal','maintenance','delayed','offline')),
  note_en text not null default '',
  note_bn text not null default '',
  sort_order integer not null default 0,
  updated_at timestamptz not null default now()
);

create table if not exists public.support_channels (
  id uuid primary key default gen_random_uuid(),
  channel_key text unique not null,
  label_en text not null,
  label_bn text not null,
  url text not null,
  icon text not null default '💬',
  is_active boolean not null default true,
  sort_order integer not null default 0,
  updated_at timestamptz not null default now()
);

create table if not exists public.site_settings (
  key text primary key,
  value jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

create table if not exists public.search_logs (
  id bigint generated always as identity primary key,
  query text not null,
  language text not null default 'bn',
  result_count integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.article_views (
  id bigint generated always as identity primary key,
  article_id uuid references public.articles(id) on delete cascade,
  language text not null default 'bn',
  created_at timestamptz not null default now()
);

alter table public.user_profiles enable row level security;
alter table public.categories enable row level security;
alter table public.articles enable row level security;
alter table public.announcements enable row level security;
alter table public.service_status enable row level security;
alter table public.support_channels enable row level security;
alter table public.site_settings enable row level security;
alter table public.search_logs enable row level security;
alter table public.article_views enable row level security;

-- Public content can be read directly if needed. Admin writes go through Netlify Functions.
drop policy if exists "public read categories" on public.categories;
create policy "public read categories" on public.categories for select using (is_active = true);

drop policy if exists "public read articles" on public.articles;
create policy "public read articles" on public.articles for select using (status = 'published');

drop policy if exists "public read announcements" on public.announcements;
create policy "public read announcements" on public.announcements for select using (is_active = true);

drop policy if exists "public read status" on public.service_status;
create policy "public read status" on public.service_status for select using (true);

drop policy if exists "public read support" on public.support_channels;
create policy "public read support" on public.support_channels for select using (is_active = true);

drop policy if exists "public read settings" on public.site_settings;
create policy "public read settings" on public.site_settings for select using (true);

create or replace function public.bump_article_view(article_uuid uuid, lang text default 'bn')
returns void language plpgsql security definer as $$
begin
  update public.articles set view_count = view_count + 1 where id = article_uuid;
  insert into public.article_views(article_id, language) values(article_uuid, lang);
end;
$$;
