const fs = require('fs');
const path = require('path');

const productsFilePath = path.join(__dirname, '../data/products.json');
let products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));
const writeProducts = (data) =>  fs.writeFileSync(productsFilePath, JSON.stringify(data), "utf-8");
const db = require('../database/models');
module.exports = {
     
    index: (req,res)  => {
     db.Products.findAll({
          include: [
            {association: "categorias" },
          ],
         
        })
          .then(products => {
               res.render('products/listProducts', {
                    products,
                    session: req.session,
               })
        })
        .catch((error) => { res.send(error)})
     
    },
    vistaJuguete: (req,res)  => {
     db.Products.findAll({
          include: [
            {association: "categorias" },
          ],
          where: [
               {category_id: 1}
          ]
         })
          .then(products => {
               res.render('products/vistaJuguetes', {
                    products,
                    session: req.session,
               })
         })
         .catch((error) => { res.send(error)})
     
    },
    vistaAccesorio: (req,res)  => {
     db.Products.findAll({
          include: [
            {association: "categorias" },
          ],
          where: [
               {category_id: 2}
          ]
         })
          .then(products => {
               res.render('products/vistaAccesorios', {
                    products,
                    session: req.session,
               })
         })
         .catch((error) => { res.send(error)})
     
    },
    vistaCamas: (req,res)  => {
     db.Products.findAll({
          include: [
            {association: "categorias" },
          ],
          where: [
               {category_id: 3}
          ]
         })
          .then(products => {
               res.render('products/vistaCamas', {
                    products,
                    session: req.session,
               })
         })
         .catch((error) => { res.send(error)})
     
    },
    vistaComida: (req,res)  => {
     db.Products.findAll({
          include: [
            {association: "categorias" },
          ],
          where: [
               {category_id: 4}
          ]
         })
          .then(products => {
               res.render('products/vistaComida', {
                    products,
                    session: req.session,
               })
         })
         .catch((error) => { res.send(error)})
     
    },
    vistaHigiene: (req,res)  => {
     db.Products.findAll({
          include: [
            {association: "categorias" },
          ],
          where: [
               {category_id: 5}
          ]
         })
          .then(products => {
               res.render('products/vistaHigiene', {
                    products,
                    session: req.session,
               })
         })
         .catch((error) => { res.send(error)})
     
    },
    
    detail: (req,res)  => {
          let productId = +req.params.id;

          db.Products.findByPk(productId)
          .then(product => {
               db.Products.findAll({where: { promo: "Destacado"}}).then( (productosDestacados) => {
                    res.render('products/productDetail', { product, session: req.session, productosDestacados})
               })
               .catch(error => console.log(error)) 
          })
          .catch(error => console.log(error))
     },

    productCart: (req,res) => {
         res.render('products/productCart', {
               session: req.session,
          })
    }
    
}

