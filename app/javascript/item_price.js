window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  const profit = document.getElementById("profit");
  const value_result = inputValue * 0.1
  console.log(value_result);
  profit.innerHTML = (Math.ceil(inputValue - value_result));
})
})