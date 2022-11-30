const express = require('express');
const router = express.Router();
const adminProductsController = require('../controller/admin/adminProductsController.js')
const adminCategoriesController = require('../controller/admin/adminCategoriesController.js')
const adminIndexController = require('../controller/admin/adminIndexController.js')
const uploadFile = require('../middlewares/uploadProducts');
const userSession = require('../middlewares/userSession');
const adminCheck = require('../middlewares/adminCheck');
const productValidator = require('../validations/productCreateValidator')


/* no se si esta bien CRUD DE PRODUCTOS ADMIN*/
router.get('/', userSession ,adminCheck , adminIndexController.index)

/* LISTA DE PRODUCTOS EN TABLA */
router.get('/list', userSession , adminCheck , adminProductsController.list);
/* GET - muestra Formulario de Agregar producto */
router.get('/add', userSession , adminCheck , adminProductsController.productAdd);
/* POST  CREA procesa informacion de formulario de agregar producto */
router.post('/add',uploadFile.single('image'), productValidator ,adminProductsController.productCreate)
/* GET - Editar producto */
router.get('/list/editar/:id', userSession , adminCheck , adminProductsController.productEdit);
/* PUT - actualiza informacion de formulario de Edicion */ 
router.put('/list/editar/:id',uploadFile.single('image'), adminProductsController.productUpdate) 

/* DELETE - para eliminar un producto */
router.delete('/list/eliminar/:id', adminProductsController.productDelete)



/* (CRUS) RUTAS ADMIN CATEGORIAS */
/* GET - Listado de productos */
router.get('/categorias/lista', userSession, adminCheck , adminCategoriesController.categoryList)
/* GET - para mostrar formulario de agregar */
router.get('/categorias/agregar', userSession, adminCheck , adminCategoriesController.categoryAdd)
/* POST - para procesar el formulario de agregar */
router.post('/categorias/lista', adminCategoriesController.createCategory) /* es la misma ruta de la lista ya que este metodo lo que va a hacer es redireccionar a esa vista con los datos ya actualizados, es decir con una nueva categoria agregada */
/* GET - mostrar formulario Editar categoria */
router.get('/categorias/editar/:id', userSession, adminCheck , adminCategoriesController.categoryEdit);
/* PUT - para procesar el formulario Edit (ACTUALIZAR LA INFO) */
router.put('/categorias/:id', adminCategoriesController.categoryUpdate);


/* DELETE - para eliminar una categoria*/
router.delete('/categorias/eliminar/:id', adminCategoriesController.categoryDelete)




/* ______________________________ */
/* para gestionar la info del formulario POST */
/*router.post('/add', adminProductsController.add)  productController.addProduct )*/
/* ______________________________ */
module.exports = router;