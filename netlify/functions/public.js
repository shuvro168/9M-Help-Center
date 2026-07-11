const { adminClient, json } = require("./_shared");

exports.handler = async (event) => {
  if (event.httpMethod === "OPTIONS") return json(204, {});
  try {
    const db = adminClient();

    if (event.httpMethod === "POST") {
      const payload = JSON.parse(event.body || "{}");
      if (payload.action === "search_log") {
        await db.from("search_logs").insert({
          query: String(payload.query || "").slice(0, 200),
          language: payload.language === "en" ? "en" : "bn",
          result_count: Number(payload.result_count || 0)
        });
        return json(200, { ok: true });
      }
      if (payload.action === "article_view" && payload.article_id) {
        await db.rpc("bump_article_view", {
          article_uuid: payload.article_id,
          lang: payload.language === "en" ? "en" : "bn"
        });
        return json(200, { ok: true });
      }
      return json(400, { error: "Invalid action" });
    }

    const now = new Date().toISOString();
    const [
      categories, articles, announcements, statuses, support, settings
    ] = await Promise.all([
      db.from("categories").select("*").eq("is_active", true).order("sort_order"),
      db.from("articles").select("*,categories(slug,icon,name_en,name_bn)").eq("status","published").order("sort_order"),
      db.from("announcements").select("*").eq("is_active", true).or(`starts_at.is.null,starts_at.lte.${now}`).or(`ends_at.is.null,ends_at.gte.${now}`).order("sort_order"),
      db.from("service_status").select("*").order("sort_order"),
      db.from("support_channels").select("*").eq("is_active", true).order("sort_order"),
      db.from("site_settings").select("*")
    ]);

    for (const result of [categories, articles, announcements, statuses, support, settings]) {
      if (result.error) throw result.error;
    }

    return json(200, {
      categories: categories.data,
      articles: articles.data,
      announcements: announcements.data,
      service_status: statuses.data,
      support_channels: support.data,
      settings: Object.fromEntries((settings.data || []).map(x => [x.key, x.value]))
    });
  } catch (error) {
    console.error(error);
    return json(error.statusCode || 500, { error: error.message || "Server error" });
  }
};
