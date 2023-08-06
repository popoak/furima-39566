window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // 販売価格を取得
    const price = parseInt(priceInput.value, 10);

    // 販売手数料の計算（Math.floorを使って小数点以下を切り捨てる）
    const fee = Math.floor(price * 0.1);

    // 販売手数料を表示
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.textContent = fee;

    // 販売利益の計算
    const profit = price - fee;

    // 販売利益を表示
    const profitDisplay = document.getElementById("profit");
    profitDisplay.textContent = profit;
  });
});

