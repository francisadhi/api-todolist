const config = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(
  config.DB,
  config.USER,
  config.PASSWORD,
  {
    host: config.HOST,
    dialect: config.dialect,
    operatorsAliases: false,

    pool: {
      max: config.pool.max,
      min: config.pool.min,
      acquire: config.pool.acquire,
      idle: config.pool.idle
    }
  }
);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require("../models/user.model.js")(sequelize, Sequelize);
db.role = require("../models/role.model.js")(sequelize, Sequelize);
db.guest = require("../models/guest.model.js")(sequelize, Sequelize);
db.user_balance = require("../models/user_balance.model.js")(sequelize, Sequelize);
db.user_balance_history = require("../models/user_balance_history.model.js")(sequelize, Sequelize);

db.user.hasMany(db.user_balance, {
  foreignKey: "userId"
});

db.user_balance.hasOne(db.user_balance_history, {
  foreignKey: "userBalanceId"
});

db.role.belongsToMany(db.user, {
  through: "user_roles",
  foreignKey: "roleId",
  otherKey: "userId"
});
db.user.belongsToMany(db.role, {
  through: "user_roles",
  foreignKey: "userId",
  otherKey: "roleId"
});

db.ROLES = ["user", "admin", "chief"];

module.exports = db;
