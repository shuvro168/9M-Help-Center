const { adminClient, json } = require("./_shared");

exports.handler = async () => {
  try {
    const db = adminClient();
    const { count, error } = await db
      .from("articles")
      .select("*", { count: "exact", head: true });
    if (error) throw error;
    return json(200, {
      ok: true,
      database: "connected",
      article_count: count || 0,
      checked_at: new Date().toISOString()
    });
  } catch (error) {
    return json(500, {
      ok: false,
      error: error.message || "Connection failed",
      required_variables: [
        "SUPABASE_URL",
        "SUPABASE_ANON_KEY",
        "SUPABASE_SERVICE_ROLE_KEY"
      ]
    });
  }
};
