  function post() {
    const priceInput = document.getElementById("item-price");
    
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      const addProfitDom = document.getElementById("profit");
  
      const taxValue = Math.floor(priceInput.value * 10 / 100);
      addTaxDom.innerHTML = taxValue;
  
      const profitValue = Math.floor(priceInput.value - taxValue);
      addProfitDom.innerHTML = profitValue;
  
      const formData = new FormData();
      formData.append("item[price]", priceInput.value);
  
      // const XHR = new XMLHttpRequest();
      // XHR.open("POST", "/items", true);
      // XHR.responseType = "json";
      // XHR.send(formData);
    });
  }
  
  window.addEventListener('turbo:load', post);
  
  function eve() {
    const priceInput = document.getElementById("item-price");

    const addTaxDom = document.getElementById("add-tax-price");
      const addProfitDom = document.getElementById("profit");
  
      const taxValue = Math.floor(priceInput.value * 10 / 100);
      addTaxDom.innerHTML = taxValue;
  
      const profitValue = Math.floor(priceInput.value - taxValue);
      addProfitDom.innerHTML = profitValue;
  
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      const addProfitDom = document.getElementById("profit");
  
      const taxValue = Math.floor(priceInput.value * 10 / 100);
      addTaxDom.innerHTML = taxValue;
  
      const profitValue = Math.floor(priceInput.value - taxValue);
      addProfitDom.innerHTML = profitValue;
  
      const formData = new FormData();
      formData.append("item[price]", priceInput.value);
  
      // const XHR = new XMLHttpRequest();
      // XHR.open("POST", "/items", true);
      // XHR.responseType = "json";
      // XHR.send(formData);
    });
  }
  
  window.addEventListener('turbo:render', eve);