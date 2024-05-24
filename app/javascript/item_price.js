document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;
      const fee = Math.floor(inputValue * 0.1);
      const profitValue = inputValue - fee;

      addTaxPrice.innerHTML = fee;
      profit.innerHTML = profitValue;
    });
  }
});
