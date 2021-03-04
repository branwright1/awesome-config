(() => {
  const fs = require("fs");
  const cssFile = "/home/bran/.config/discocss/custom.css";

  function reload(style) {
      style.innerHTML = fs.readFileSync(cssFile);
  }

  function inject({ document, window }) {
    window.addEventListener("load", () => {
      const style = document.createElement("style");
      reload(style);
      document.head.appendChild(style);

      fs.watch(cssFile, {}, () => reload(style));
    });
  }

  inject(require("electron").webFrame.context);
})();
