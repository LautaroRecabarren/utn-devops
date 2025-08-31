import express from "express";
import { getMessages } from "./db.js";

const app = express();
const PORT = Number(process.env.PORT || 8080);

app.get("/healthz", (_req, res) => res.json({ ok: true }));

app.get("/", async (_req, res) => {
  try {
    const messages = await getMessages();
    res.json({ from: "database", messages });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "DB error" });
  }
});

app.listen(PORT, () => {
  console.log(`Web listening on :${PORT}`);
});
