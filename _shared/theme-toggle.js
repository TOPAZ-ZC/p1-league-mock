// P1 League — light/dark theme toggle
// Doctrine: every UI build ships with a visible toggle persisted to localStorage.
(function () {
  var KEY = "p1-theme";
  var root = document.documentElement;
  var saved = (function () {
    try {
      return localStorage.getItem(KEY);
    } catch (e) {
      return null;
    }
  })();
  var initial = saved || "dark";
  root.setAttribute("data-theme", initial);

  function setTheme(t) {
    root.setAttribute("data-theme", t);
    try {
      localStorage.setItem(KEY, t);
    } catch (e) {}
    document.querySelectorAll("[data-theme-label]").forEach(function (el) {
      el.textContent = t === "dark" ? "LIGHT" : "DARK";
    });
  }

  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("[data-theme-label]").forEach(function (el) {
      el.textContent = root.getAttribute("data-theme") === "dark" ? "LIGHT" : "DARK";
    });
    document.querySelectorAll("[data-theme-toggle]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        var cur = root.getAttribute("data-theme") || "dark";
        setTheme(cur === "dark" ? "light" : "dark");
      });
    });
  });
})();
