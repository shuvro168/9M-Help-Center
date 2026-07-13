# 9M Knowledge Center V3 Final

This package works immediately after deployment using built-in content.

To enable live Supabase data:
1. Run `supabase/schema_v3.sql`
2. Run `supabase/seed_v3.sql`
3. Copy Supabase Publishable key
4. Replace `PASTE_YOUR_PUBLISHABLE_KEY_HERE` in `config.js`

No Secret key, service-role key, Netlify Functions, build command, or environment variables are required.

Netlify:
- Base directory: empty
- Build command: empty
- Publish directory: `.`

The public page continues working with built-in data even before Supabase is connected.
