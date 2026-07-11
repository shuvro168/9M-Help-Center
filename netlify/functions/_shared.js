const { createClient } = require("@supabase/supabase-js");

function env(name) {
  const value = process.env[name];
  if (!value) throw new Error(`Missing environment variable: ${name}`);
  return value;
}

function adminClient() {
  return createClient(env("SUPABASE_URL"), (process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY || env("SUPABASE_SERVICE_ROLE_KEY")), {
    auth: { persistSession: false, autoRefreshToken: false }
  });
}

function json(statusCode, body) {
  return {
    statusCode,
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "no-store",
      "access-control-allow-origin": "*",
      "access-control-allow-headers": "content-type, authorization",
      "access-control-allow-methods": "GET,POST,PUT,DELETE,OPTIONS"
    },
    body: JSON.stringify(body)
  };
}

async function requireEditor(event) {
  const auth = event.headers.authorization || event.headers.Authorization || "";
  const token = auth.replace(/^Bearer\s+/i, "");
  if (!token) throw Object.assign(new Error("Unauthorized"), { statusCode: 401 });
  const supabase = adminClient();
  const { data: userData, error: userError } = await supabase.auth.getUser(token);
  if (userError || !userData.user) throw Object.assign(new Error("Unauthorized"), { statusCode: 401 });
  const { data: profile, error: profileError } = await supabase
    .from("user_profiles").select("role").eq("user_id", userData.user.id).single();
  if (profileError || !profile) throw Object.assign(new Error("Forbidden"), { statusCode: 403 });
  return { supabase, user: userData.user, role: profile.role };
}

module.exports = { adminClient, json, requireEditor };
