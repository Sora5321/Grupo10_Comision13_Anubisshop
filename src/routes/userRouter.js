const express = require('express');
const router = express.Router();
const userController = require('../controller/userController');
const upload = require('../middlewares/uploadAvatar');
const registerValidator = require('../validations/registerValidator');
const loginValidator = require('../validations/loginValidator');
const userInSession = require('../middlewares/userInSession');
const userSessionCheck = require('../middlewares/userSession'); /* linea agregada */
const profileValidator = require("../validations/profileValidator");


router.get('/login', userInSession ,userController.login);
router.post('/login', loginValidator, userController.processLogin);

router.get('/register', userInSession ,userController.register);
router.post('/register', upload.single('avatar'), registerValidator ,userController.processRegister)

router.get('/perfil/:id', userSessionCheck, userController.userProfile); /* linea agregada */
router.put('/perfil', profileValidator , userController.profileEdit)

router.get('/logout', userController.logout);

module.exports = router;
