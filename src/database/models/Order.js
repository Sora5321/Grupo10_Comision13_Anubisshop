module.exports = (sequelize, dataTypes) =>{

    let alias = 'Order';

    let cols = {
        id:{
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true,
            allowNull: false    
        },
        user_id:{
            type: dataTypes.INTEGER(11),
            allowNull:false
        },
        state: {
            type: dataTypes.STRING(45),
            allowNull:false

        }
    }

    let config = {
        tableName: 'orders',
        timestamps: false,
    }

    const Order = sequelize.define(alias, cols, config);

    Order.associate = (models) => {
        Order.belongsTo(models.User, {
            as: "user",
            foreignKey: "user_id"
        })
        Order.hasMany(models.OrderItem, {
            as: "order_items",
            foreignKey: "order_id"
        })
    }
    
    return Order

}