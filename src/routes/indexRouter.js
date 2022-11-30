const express = require('express');
const router = express.Router();
const indexController = require('../controller/indexController')

router.get('/', indexController.index);
router.get('/search', indexController.search);
router.get('/contacto', indexController.contact);
router.get('/nosotros', indexController.nosotros);


module.exports = router;
