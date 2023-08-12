import "../css/app.css";

import htmx from "htmx.org";
window.htmx = htmx;

htmx.onLoad(() => {
  import("htmx-remove");
});
