module.exports = function(sequelize, dataTypes){
    let alias = 'Products';

    let cols= {
        id:{
            type:dataTypes.INTEGER(11),
            primaryKey:true,
            autoIncrement:true,
            allowNull:false,
        },
        name:{
            type:dataTypes.STRING(45),
            allowNull:false,
        },
        price:{
            type:dataTypes.INTEGER(11),
            allowNull:false,
        },
        description:{
            type:dataTypes.TEXT,
        },
        category_id:{
            type:dataTypes.INTEGER(11),
            allowNull:false,
        },
        promo:{
            type:dataTypes.STRING(20),
        },
        discount:{
            type:dataTypes.INTEGER(11),
        },
        images:{
            type:dataTypes.STRING(45),
        }
        /* stock: {
            type: dataTypes.BOOLEAN,
            allowNull: false,
        }  */    
        
    }

    let config = {
        tableName: "products",
        timestamps: false,
        
    }

    const Product = sequelize.define(alias, cols, config);

    Product.associate = (models) => {
        Product.belongsTo(models.Category, {
            as: "categorias",
            foreignKey: "category_id"
        })        
        Product.hasMany(models.OrderItem, {
            as: "orderItems",
            foreignKey: "product_id"
        })
       
        
    }
 

    return Product;
}