document.addEventListener("DOMContentLoaded", () => {
  const btn = document.getElementById("fetch_ai_btn");
  if (!btn) return;

  btn.addEventListener("click", async () => {
    const title = document.getElementById("movie_title_input").value;
    if (!title.trim()) return alert("Digite um título!");

    btn.textContent = "Buscando... 🤖";
    btn.disabled = true;

    const response = await fetch(`/fetch_movie_data?title=${encodeURIComponent(title)}`);
    const data = await response.json();

    if (response.ok) {
      document.getElementById("movie_year").value = data.year || "";
      document.getElementById("movie_duration").value = data.duration || "";
      document.getElementById("movie_director").value = data.director || "";
      document.getElementById("movie_synopsis").value = data.synopsis || "";
    } else {
      alert(data.error || "Erro ao buscar informações");
    }

    btn.textContent = "Buscar por IA 🤖";
    btn.disabled = false;
  });
});
