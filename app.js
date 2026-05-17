(() => {
  const output = document.getElementById("count");
  const incrementBtn = document.getElementById("increment");
  const decrementBtn = document.getElementById("decrement");
  const resetBtn = document.getElementById("reset");
  const loadedAt = document.getElementById("loaded-at");

  let count = 0;
  const render = () => {
    output.textContent = String(count);
  };

  incrementBtn.addEventListener("click", () => {
    count += 1;
    render();
  });
  decrementBtn.addEventListener("click", () => {
    count -= 1;
    render();
  });
  resetBtn.addEventListener("click", () => {
    count = 0;
    render();
  });

  const now = new Date();
  loadedAt.dateTime = now.toISOString();
  loadedAt.textContent = now.toLocaleString("de-DE");
})();
