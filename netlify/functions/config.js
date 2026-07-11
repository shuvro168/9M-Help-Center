const { json } = require("./_shared");

exports.handler = async () => {
  const url = process.env.SUPABASE_URL || "";
  const anonKey =
    process.env.SUPABASE_ANON_KEY ||
    process.env.SUPABASE_PUBLISHABLE_KEY ||
    "";

  if (!url || !anonKey) {
    return json(500, {
      error: "Missing public Supabase configuration",
      required: ["SUPABASE_URL", "SUPABASE_ANON_KEY"]
    });
  }

  return json(200, { url, anonKey });
};
