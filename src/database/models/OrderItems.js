module.exports = (sequelize, dataTypes) =>{

    let alias = 'OrderItem';

    let cols = {
        id:{
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true,
            allowNull: false    
        },
        order_id:{
            type: dataTypes.INTEGER(11),
            allowNull:false
        },
        product_id:{
            type: dataTypes.INTEGER(11),
            allowNull:false
        },
        quantity: {
            type: dataTypes.INTEGER(11),
            allowNull: false,
            defaultValue: 1
        }
    }

    let config = {
        tableName: 'order_items',
        timestamps: false
    }

    const OrderItem = sequelize.define(alias, cols, config);

    OrderItem.associate = (models) => {
        OrderItem.belongsTo(models.Order, {
            as: "orders",
            foreignKey: "order_id"
        })
        OrderItem.hasMany(models.Products, {
            as: "products",
            foreignKey: "product_id"
        })
    }

    return OrderItem

}