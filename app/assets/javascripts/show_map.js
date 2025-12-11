document.addEventListener("turbo:load", () => {
  const mapElement = document.getElementById("uolog-map");
  if (!mapElement) return;

  const lat = parseFloat(mapElement.dataset.lat);
  const lng = parseFloat(mapElement.dataset.lng);

  const map = L.map("uolog-map").setView([lat, lng], 13);
  console.log("SHOW_MAP LOADED!");

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png").addTo(map);

  L.marker([lat, lng]).addTo(map);

  setTimeout(() => {
    map.invalidateSize();
  }, 300);
});