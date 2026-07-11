# 9M Help Center Pro V2

## Netlify build settings

- Base directory: leave empty
- Build command: leave empty
- Publish directory: `.`
- Functions directory: `netlify/functions`

## Netlify environment variables

Add exactly these three variables:

1. `SUPABASE_URL`
   - Supabase → Data API → API URL

2. `SUPABASE_ANON_KEY`
   - Supabase → Settings → API Keys → Publishable key

3. `SUPABASE_SERVICE_ROLE_KEY`
   - Supabase → Settings → API Keys → Secret key
   - A legacy `service_role` key also works.

Never place the secret key inside HTML or send it publicly.

## Deploy

Connect the GitHub repository to Netlify and deploy.

After deployment, test:

- `/setup-check.html`
- `/.netlify/functions/health`
- `/api/public`
- `/admin.html`

A successful health response looks like:

```json
{
  "ok": true,
  "database": "connected",
  "article_count": 28
}
```

## Supabase database

Run these files once, in order:

1. `supabase/schema.sql`
2. `supabase/seed.sql`

## Administrator setup

Create a user in Supabase Authentication, copy the user UUID, then run:

```sql
insert into public.user_profiles(user_id, role)
values ('YOUR-USER-UUID', 'admin');
```

Admin page: `/admin.html`
