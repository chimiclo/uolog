document.addEventListener("DOMContentLoaded", () => {
    const input = document.getElementById("catch_images_input");
    const previewArea = document.getElementById("preview-area");

    if (!input || !previewArea) return;

    input.addEventListener("change", (e) => {
      previewArea.innerHTML = ""; // 一旦クリア

      const files = Array.from(e.target.files);

      files.forEach((file) => {
        if (!file.type.match("image.*")) return;

        const reader = new FileReader();

        reader.onload = (event) => {
          const img = document.createElement("img");
          img.src = event.target.result;
          img.classList.add("preview-thumb");
          previewArea.appendChild(img);
        };

        reader.readAsDataURL(file);
      });
    });
  });