const CLOUD_FUNCTION_URL = "https://visitor-counter-v2-ltm2g2beyq-el.a.run.app";

fetch(CLOUD_FUNCTION_URL)
  .then(response => response.json())
  .then(data => {
    document.getElementById("visitor-count").textContent = data.count;
  })
  .catch(error => {
    console.error("Error fetching visitor count:", error);
    document.getElementById("visitor-count").textContent = "N/A";
  });
