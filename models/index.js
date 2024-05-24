const config = require("../config/db.config");
const { Sequelize } = require("sequelize");
const sequelize = new Sequelize(config.DB, config.USER, config.PASSWORD, {
  host: config.HOST,
  dialect: config.dialect,
});

// async function testConnection() {
//   try {
//     await sequelize.authenticate();
//     console.log("Connection has been established successfully.");
//   } catch (error) {
//     console.error("Unable to connect to the database:", error);
//   }
// }

// testConnection();
// console.log("here");

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require("../models/user.model.js")(sequelize, Sequelize);
db.role = require("../models/role.model.js")(sequelize, Sequelize);
// db.userRole = require("../models/userRole.model.js")(sequelize, Sequelize);

//with this we are creating association by adding foreign keys
// db.role.belongsToMany(db.user, {
//   through: db.userRole,
//   foreignKey: "ROLE_ID",
// });
// db.user.belongsToMany(db.role, {
//   through: db.userRole,
//   foreignKey: "USER_ID",
// });

db.ROLES = ["user", "student", "faculty"];

module.exports = db;
