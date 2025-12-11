document.addEventListener("turbo:load", () => {
  const mapElement = document.getElementById("uolog-map");
  if (!mapElement) return;

  const latField = document.getElementById("latitude_field");
  const lngField = document.getElementById("longitude_field");

  const lat = parseFloat(latField?.value || "26.3344");
  const lng = parseFloat(lngField?.value || "127.8056");

  const map = L.map("uolog-map").setView([lat, lng], 10);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 18,
    attribution: "&copy; OpenStreetMap contributors",
  }).addTo(map);

  let marker;

  map.on("click", (e) => {
    const clickedLat = e.latlng.lat;
    const clickedLng = e.latlng.lng;

    if (latField) latField.value = clickedLat;
    if (lngField) lngField.value = clickedLng;

    if (marker) map.removeLayer(marker);
    marker = L.marker([clickedLat, clickedLng]).addTo(map);
  });
});