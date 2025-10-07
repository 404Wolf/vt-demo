import { Container } from "@cloudflare/containers";
import { Hono } from "hono";
import process from "node:process";

export class VTDemo extends Container<Env> {
  override defaultPort = 8080;
  override sleepAfter = "2m";
  override envVars: Record<string, string> | undefined = {
    "VAL_TOWN_API_KEY": process.env.VAL_TOWN_API_KEY,
  };
}

const app = new Hono<{
  Bindings: Env;
}>();

app.get("*", async (c) => {
  const id = c.req.query("id");
  const containerId = c.env.VT_DEMO.idFromName(`/box/${id}`);
  const container = c.env.VT_DEMO.get(containerId);

  const url = new URL(c.req.url);
  url.pathname = url.pathname.replace(/^\/box\/[^\/]+/, '');
  const newRequest = new Request(url, c.req.raw);
  console.log(url.pathname)
  return await container.fetch(newRequest);
});

export default app;
