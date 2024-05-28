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

db.header = require("../models/header.model.js")(sequelize, Sequelize);
db.roleHeader = require("../models/roleHeader.js")(sequelize, Sequelize);

db.menu = require("../models/menu.model.js")(sequelize, Sequelize);
db.headerMenu = require("../models/headerMenu.js")(sequelize, Sequelize);

db.header.hasMany(db.roleHeader, { foreignKey: "HEADER_ID" });
db.role.hasMany(db.roleHeader, { foreignKey: "ROLE_ID" });
db.roleHeader.belongsTo(db.header, { foreignKey: "HEADER_ID" });
db.roleHeader.belongsTo(db.role, { foreignKey: "ROLE_ID" });

db.menu.hasMany(db.headerMenu, { foreignKey: "MENU_ID" });
db.header.hasMany(db.headerMenu, { foreignKey: "HEADER_ID" });
db.headerMenu.belongsTo(db.header, { foreignKey: "HEADER_ID" });
db.headerMenu.belongsTo(db.menu, { foreignKey: "MENU_ID" });

db.menu.hasMany(db.menu, { as: "SubMenus", foreignKey: "PARENT_ID" });
db.menu.belongsTo(db.menu, { as: "ParentMenu", foreignKey: "PARENT_ID" });

// db.userRole = require("../models/userRole.model.js")(sequelize, Sequelize);

//ALTERNATE WAY:::with this we are creating association by adding foreign keys
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
