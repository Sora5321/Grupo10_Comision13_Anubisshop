const fs = require('fs');
const path = require('path');

const db = require('../database/models');
const {Op} = db.Sequelize;

const removeAccents = (str) => {
	return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  }

const controller = {
    index: (req,res)  => {
		db.Products.findAll()
			.then(products => {
				let productosOferta = products.filter((product)=> product.promo === "Oferta" )
				let productosDestacados = products.filter((product)=> product.promo === "Destacado" )
				 

				res.render('home' , {
					titulo: "Homepage",
					productosOferta,
					productosDestacados,
					session: req.session,
					
		
				})
		  })
		  .catch((error) => { res.send(error)})
	   
    },
    search: (req,res)  => {
		let search = req.query.keywords;
        let searchProduct = search
    
        db.Products.findAll({
            where:{
                name:{[Op.like]:`%${searchProduct}%`}
            }
        })
        .then(products=>{
    
            res.render('result',{
                products,
				keyword: req.query.keywords,
                session:req.session
                })
        })
        .catch((error) => { res.send(error)})

       /*  let searchResult = [];

		products.forEach(product => {
			if(removeAccents(product.name.toLowerCase()).includes(req.query.keywords.toLowerCase())){
				searchResult.push(product)
			}
		});

		res.render('result', {
			searchResult,
			keyword: req.query.keywords,
            products,
            session: req.session,
		}); */
    },
	contact: (req,res) =>{
		res.render('contact', {session: req.session})

	},
	nosotros: (req,res) =>{
		res.render('nosotros', {session: req.session})

	},
    
}

module.exports = controller