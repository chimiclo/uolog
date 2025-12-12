document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("uolog-map");
  if (!el) return;

  if (!document.querySelector(".catch-form-container")) return;

  console.log("🗺 CLICK_MAP LOADED");

  const latField = document.getElementById("latitude_field");
  const lngField = document.getElementById("longitude_field");

  const lat = parseFloat(el.dataset.lat || "26.3344");
  const lng = parseFloat(el.dataset.lng || "127.8056");

  const map = L.map(el).setView([lat, lng], 12);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 18,
  }).addTo(map);

  let marker = null;

  if (latField?.value && lngField?.value) {
    marker = L.marker([latField.value, lngField.value]).addTo(map);
  }

  map.on("click", (e) => {
    const { lat, lng } = e.latlng;

    latField.value = lat;
    lngField.value = lng;

    if (marker) marker.remove();
    marker = L.marker([lat, lng]).addTo(map);

    console.log("📌 saved:", lat, lng);
  });

  setTimeout(() => map.invalidateSize(), 300);
});