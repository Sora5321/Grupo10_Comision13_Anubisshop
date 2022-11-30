module.exports = function(sequelize, dataTypes){
    let alias = 'User';

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
        rol_id:{
            type:dataTypes.INTEGER(11),
            allowNull:false,
        },
        email:{
            type:dataTypes.STRING(60),
            allowNull:false
        },
        password:{
            type:dataTypes.STRING(70),
            defaultValue: null,
        },
        avatar:{
            type:dataTypes.STRING(45),
            
        },
        phone:{
            type:dataTypes.STRING(70),
            
        }
    }

    let config = {
        tableName: "users",
        timestamps: false,
    }

    const User = sequelize.define(alias, cols, config);

    User.associate = (models) => {
        User.belongsTo(models.UserRol, {
            as: "rol",
            foreignKey: "rol_id"
        })
        User.hasMany(models.Address, {
            as: "addresses",
            foreignKey: "user_id"
        })
        User.hasMany(models.Order, {
            as: "orders",
            foreignKey: "user_id"
        })

    };

    return User;
}