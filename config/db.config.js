const db = require("../env/secret.json");

module.exports = {
  HOST: db.host,
  USER: db.user,
  PASSWORD: db.password,
  DB: "template_db",
  dialect: "mysql",
}; //database configuration
