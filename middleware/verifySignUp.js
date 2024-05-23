const db = require("../models/index");

const User = db.user;
const ROLES = db.ROLES;
checkDuplicateUsernameOrEmail = (req, res, next) => {
  //userName
  User.findOne({
    where: {
      USER_NAME: req.body.username,
    },
  }).then((user) => {
    if (user) {
      res.status(400).json({
        message: "Failed! Username is already in use!",
      });
    }
  });
  //email
  User.findOne({
    where: {
      EMAIL: req.body.email,
    },
  }).then((user) => {
    if (user) {
      res.status(400).json({
        message: "Failed! Email is already in use!",
      });
    }
    next();
  });
};

checkRolesExisted = (req, res, next) => {
  if (req.body.roles) {
    for (let i = 0; i < req.body.roles.length; i++) {
      if (!ROLES.includes(req.body.roles[i])) {
        res.status(400).send({
          message: "Failed! Role does not exist = " + req.body.roles[i],
        });
        return;
      }
    }
  }

  next();
};

const verifySignUp = {
  checkDuplicateUsernameOrEmail: checkDuplicateUsernameOrEmail,
  checkRolesExisted: checkRolesExisted,
};

module.exports = verifySignUp;
