let button = document.querySelector('.menu-button');
let menu = document.querySelector('.header_nav-burger');
let closeButton = document.querySelector('.close-nav');

button.addEventListener('click', () => {
    menu.classList.add('active');
})

closeButton.addEventListener('click', () => {
    menu.classList.remove('active');
})

/* HEADER ADMIN */
const buttonProductos = document.querySelector('#_productos');
const buttonCategorias = document.querySelector('#_categorias');
const miniMenu = document.querySelector('.mini-menu')
const miniMenu2 = document.querySelector('.mini-menu2')
/* const buttonCerrarSesion = document.querySelector('#_productos'); */

buttonProductos.addEventListener('click', ()=> {
    miniMenu.classList.toggle('active')

})
buttonCategorias.addEventListener('click', ()=> {
    miniMenu2.classList.toggle('active')

})