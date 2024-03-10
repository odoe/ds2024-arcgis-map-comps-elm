import "./style.css";
import "@arcgis/core/assets/esri/themes/light/main.css";
import { defineCustomElements } from "@arcgis/map-components/dist/loader";
import { Elm } from "./src/Main.elm";

defineCustomElements();

if (process.env.NODE_ENV === "development") {
  const ElmDebugTransform = await import("elm-debug-transformer");

  ElmDebugTransform.register({
    simple_mode: true,
  });
}

const root = document.querySelector("#app div");
const app = Elm.Main.init({ node: root });
