document.addEventListener('DOMContentLoaded', () => {
  initializeAppPriceCalculation();
});

  document.addEventListener('turbo:load', () => {
    initializeAppPriceCalculation();
  })



function intializeAppPriceCalculation() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;
      const fee = Math.floor(inputValue * 0.1);
      const profitValue = Math.floor(inputValue - fee);

      addTaxPrice.innerHTML = fee;
      profit.innerHTML = profitValue;
    });
  }
}
