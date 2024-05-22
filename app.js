const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const authRoutes = require("./api/routes/auth.routes");
const db = require("./models/index");

const Role = db.role;
const app = express();

// app.use acts as a middleware and every request has to pass thrgh this

app.use(morgan("dev"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use((req, res, next) => {
  res.header("Allow-Control-Allow-Origin", "*");
  res.header(
    "Allow-Control-Allow-Headers",
    "Origin,X-Requeste-With,Content-Type,Accept,Authorization"
  );
  if (req.method === "OPTIONS") {
    res.header("Access-Control-Allow-Methods", "PUT,POST,DELETE,GET,PATCH");
    return res.status(200).json({});
  }
  next();
});

//this is to to sync models with actual tables in the db
db.sequelize.sync().then(() => {});

app.use("/api/auth", authRoutes);

//handling error
app.use((req, res, next) => {
  const error = new Error(" route not found");
  error.status = 404;
  next(error);
});
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message,
    },
  });
});
module.exports = app;
