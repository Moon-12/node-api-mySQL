var mysql = require("mysql2");
const db = require("./env/secret");

var con = mysql.createConnection({
  host: db.host,
  user: db.user,
  password: db.password,
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});
