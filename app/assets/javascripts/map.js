function initClickMap() {
  if (!document.body.classList.contains("catches-form-page")) return;

  const el = document.getElementById("uolog-map");
  if (!el) return;

  const latField = document.getElementById("latitude_field");
  const lngField = document.getElementById("longitude_field");

  const lat = parseFloat(el.dataset.lat || "26.3344");
  const lng = parseFloat(el.dataset.lng || "127.8056");

  const map = L.map(el).setView([lat, lng], 10);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 18,
  }).addTo(map);

  let marker = null;

  map.on("click", (e) => {
    const la = e.latlng.lat;
    const ln = e.latlng.lng;

    if (latField) latField.value = la;
    if (lngField) lngField.value = ln;

    if (marker) marker.remove();
    marker = L.marker([la, ln]).addTo(map);
  });
}

document.addEventListener("turbo:load", initClickMap);
document.addEventListener("DOMContentLoaded", initClickMap);