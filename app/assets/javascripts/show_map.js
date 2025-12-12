document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("uolog-map");
  if (!el) return;

  if (document.querySelector(".catch-form-container")) return;

  console.log("📍 SHOW_MAP LOADED");

  const lat = parseFloat(el.dataset.lat);
  const lng = parseFloat(el.dataset.lng);

  if (isNaN(lat) || isNaN(lng)) {
    console.warn("⚠️ 座標なし");
    return;
  }

  const map = L.map(el).setView([lat, lng], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 18,
  }).addTo(map);

  L.marker([lat, lng]).addTo(map);

  setTimeout(() => map.invalidateSize(), 300);
});