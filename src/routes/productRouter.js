const express = require('express');
const router = express.Router();
const productController = require('../controller/productController')
const uploadFile = require('../middlewares/uploadProducts');
const userSession = require('../middlewares/userSession');

/* Todos los productos */
router.get('/', productController.index);
router.get('/juguetes', productController.vistaJuguete);
router.get('/accesorios', productController.vistaAccesorio);
router.get('/camas', productController.vistaCamas);
router.get('/comidas', productController.vistaComida);
router.get('/higiene', productController.vistaHigiene);

/* Detalle de productos */
router.get('/detail/:id', productController.detail);


/* Carrito de productos */
router.get('/cart', userSession ,productController.productCart);


module.exports = router;
