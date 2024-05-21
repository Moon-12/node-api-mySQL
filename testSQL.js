import db from "./env/secret";
var mysql = require("mysql2");

var con = mysql.createConnection({
  host: db.host,
  user: db.user,
  password: db.password,
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  con.query("SELECT * FROM nammadb.table2", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});
