const { json, requireEditor } = require("./_shared");

const TABLES = new Set([
  "categories","articles","announcements","service_status","support_channels","site_settings"
]);

exports.handler = async (event) => {
  if (event.httpMethod === "OPTIONS") return json(204, {});
  try {
    const { supabase, role } = await requireEditor(event);
    const payload = event.body ? JSON.parse(event.body) : {};
    const table = payload.table || event.queryStringParameters?.table;
    if (!TABLES.has(table)) return json(400, { error: "Invalid table" });

    if (event.httpMethod === "GET") {
      const { data, error } = await supabase.from(table).select("*").order("sort_order", { ascending: true });
      if (error) throw error;
      return json(200, { data, role });
    }

    if (event.httpMethod === "POST") {
      const row = payload.row || {};
      const { data, error } = await supabase.from(table).insert(row).select().single();
      if (error) throw error;
      return json(200, { data });
    }

    if (event.httpMethod === "PUT") {
      if (!payload.id && table !== "site_settings") return json(400, { error: "Missing id" });
      const row = payload.row || {};
      let query = supabase.from(table).update(row);
      query = table === "site_settings" ? query.eq("key", payload.key) : query.eq("id", payload.id);
      const { data, error } = await query.select().single();
      if (error) throw error;
      return json(200, { data });
    }

    if (event.httpMethod === "DELETE") {
      if (role !== "admin") return json(403, { error: "Only admins can delete records" });
      if (!payload.id) return json(400, { error: "Missing id" });
      const { error } = await supabase.from(table).delete().eq("id", payload.id);
      if (error) throw error;
      return json(200, { ok: true });
    }

    return json(405, { error: "Method not allowed" });
  } catch (error) {
    console.error(error);
    return json(error.statusCode || 500, { error: error.message || "Server error" });
  }
};
