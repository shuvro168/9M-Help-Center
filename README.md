# 9M Help Center — Dynamic Edition

This package upgrades the previous static FAQ into a dynamic help center with:

- Supabase database
- Netlify Functions API
- Bangla-first public website
- English language switch
- Dynamic categories and FAQ articles
- Announcement management
- Service status management
- Support-link management
- Search logging and article view statistics
- Admin login and content-management page

## 1. Create Supabase project

Create a Supabase project, then open SQL Editor and run:

1. `supabase/schema.sql`
2. `supabase/seed.sql`

## 2. Create the administrator

In Supabase:

1. Authentication → Users → Add user.
2. Copy the new user's UUID.
3. Run this SQL, replacing the UUID:

```sql
insert into public.user_profiles(user_id, role)
values ('YOUR-USER-UUID', 'admin');
```

Available roles:

- `admin`: create, edit and delete
- `editor`: create and edit; cannot delete

## 3. Deploy to Netlify

Upload this folder to GitHub and connect it to Netlify, or deploy through Netlify CLI.

Add these Netlify environment variables:

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`

Never place the service-role key in HTML.

## 4. Pages

- Public Help Center: `/`
- Admin: `/admin.html`

## 5. Current support link

The seed data uses:

`https://t.me/VIP_9m068`

After deployment, change it from Admin → Support Channels.

## Important

The website cannot become live-dynamic until a Supabase project and the three Netlify environment variables are connected. The source code, database schema, API and administration interface are already included in this package.
