const { json } = require("./_shared");
exports.handler = async () => {
  try {
    return json(200, {
      url: process.env.SUPABASE_URL,
      anonKey: process.env.SUPABASE_ANON_KEY
    });
  } catch (error) {
    return json(500, { error: error.message });
  }
};
