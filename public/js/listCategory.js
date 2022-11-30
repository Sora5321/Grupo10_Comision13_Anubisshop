
let listCategorys = document.querySelector('#listCatProdButton');
let productCat = document.querySelector('#selectCategory');

listCategorys.addEventListener('click', () => {
    productCat.classList.toggle('active');

})
