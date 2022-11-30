const fs = require('fs');
const path = require('path');
const { validationResult } = require('express-validator');

const db = require('../../database/models');

module.exports = {
     list: (req, res) => {
      db.Products.findAll({
        include: [
          {association: "categorias" },
        ]
      })
        .then(product => {
          res.render('admin/products/listProducts', {
               productos: product,
               session: req.session,
          })
      })
     },
     productAdd: (req, res) => {
        db.Category.findAll()
        .then((categories) => {
        res.render('admin/products/addProductForm', {
            titulo: "Agregar producto",
            session: req.session,
            categories
          })
        })
        .catch((error) => res.send(error))

     },
     productCreate:(req ,res)  => {
          let errors = validationResult(req);
      
          if(errors.isEmpty()){
            db.Products.create({
               ...req.body,
               category_id: req.body.categoryId,
               images: req.file ? req.file.filename : "default-image.png",

          })
          .then((products) => {
               
               res.redirect('/admin/list')
               
          })
          .catch(error => console.log(error))
          }else{
               res.render('admin/products/addProductForm', { 
               titulo: "Agregar producto",
               errors: errors.mapped(),
               old: req.body,
               session: req.session,
               })
          } 
     },
     productEdit: (req, res)=>{
          let productId = +req.params.id;

          db.Products.findByPk(productId, {include: [
            {association: "categorias" },
          ]})
          .then(producto => {
            db.Category.findAll().then((categories) => {
              res.render('admin/products/editProductForm', {
                producto,
                categories,
                session: req.session,
              })
            })
            .catch(error => console.log(error))
          })
          .catch(error => console.log(error))

     },
     productUpdate:(req,res)  => {

     let errors = validationResult(req);
          if(errors.isEmpty()){
            db.Products.update({
              ...req.body,
              category_id: req.body.categoryId,
              image: req.file ? req.file.filename : "default-image.png",
            },{
              where: {
                id: req.params.id
              }
            })
            .then((producto)=> {
              if (req.file) {
                if (fs.existsSync("/images", producto.images) &&
                    producto.images !== "default-image.png"){ fs.unlinkSync("/images", producto.images) }
              }
              res.redirect('/admin/list')
            })
            .catch(error => console.log(error))
          }else{
            let productId = +req.params.id;

            db.Product.findByPk(productId )
            .then(producto => {
              res.render('admin/products/editProductForm', {
                titulo: "Editar producto",
                producto,
                errors: errors.mapped(),
                old: req.body,
                session: req.session,
            })
          })
          .catch(error => console.log(error))
          }     
     },
     productDelete: (req,res)  => {
        let productId = +req.params.id;

        db.Products.destroy({
          where: {
            id: productId 
          }
        })
        .then(()=>res.redirect('/admin/list'))
        .catch(error => console.log(error))

       
     },
    
}