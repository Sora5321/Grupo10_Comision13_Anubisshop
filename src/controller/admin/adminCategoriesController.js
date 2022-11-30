const db = require('../../database/models');


module.exports={
    categoryList: (req, res) => {
      db.Category.findAll()
      .then(categories => {
        res.render('admin/categories/listCategory', {
           categorias: categories,
           session: req.session,
        })
      })
    },
    categoryAdd: (req, res) => {
        res.render('admin/categories/addCategory', {
          session: req.session,
        })
    },
    createCategory: (req ,res)  => {
      db.Category.create({
        ...req.body
      })
      .then((categoria) => {
        res.redirect('/admin/categorias/lista')
      })
      .catch(error => console.log(error))
        
    },
    categoryEdit: (req, res)=>{
      let idCategory = +req.params.id;

      db.Category.findByPk(idCategory)
        .then( (categoria) => {
          res.render('admin/categories/editCategory', {categoria, session: req.session})
          })
          .catch(error => console.log(error))
    },
    categoryUpdate: (req, res) => {
      db.Category.update({
        ...req.body,
        },{
          where: {
            id: req.params.id
        }
        })
        .then(()=> {
          res.redirect('/admin/categorias/lista')
        })
        .catch(error => console.log(error))
    },
    categoryDelete: (req,res)  => {
      let categoryId = +req.params.id;

        db.Category.destroy({
          where: {
            id: categoryId
          }
        })
        .then(()=> res.redirect('/admin/categorias/lista'))
        .catch(error => console.log(error))
    },
}