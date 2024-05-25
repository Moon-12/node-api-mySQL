const db = require("../models");
//const config = require("../config/auth.config");
const env = require("../env/secret.json");
const User = db.user;
const Role = db.role;

const Op = db.Sequelize.Op;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

exports.signup = async (req, res) => {
  // Save User to Database
  await User.create({
    USER_NAME: req.body.username,
    EMAIL: req.body.email,
    PASSWORD: bcrypt.hashSync(req.body.password, 8),
    ROLE_ID: req.body.roleID,
  })
    .then((user) => {
      res.send({ message: "User was registered successfully!" });
      // if (req.body.roles) {
      //   Role.findAll({
      //     where: {
      //       ROLE_NAME: {
      //         [Op.or]: req.body.roles,
      //       },
      //     },
      //   }).then((roles) => {
      //     user.setRoles(roles).then(() => {
      //       res.send({ message: "User was registered successfully!" });
      //     });
      //   });
      // } else {
      //   // user role = 100
      //   user.setRoles([100]).then(() => {
      //     res.send({ message: "User was registered successfully!" });
      //   });
      // }
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};

exports.login = async (req, res) => {
  User.findOne({
    where: {
      EMAIL: req.body.email,
    },
  })
    .then((user) => {
      if (!user) {
        return res.status(404).send({ message: "User Not found." });
      }

      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.PASSWORD
      );

      if (!passwordIsValid) {
        return res.status(401).send({
          accessToken: null,
          message: "Invalid Password!",
        });
      }

      const token = jwt.sign({ id: user.ID }, env.JWT_KEY, {
        algorithm: "HS256",
        allowInsecureKeySizes: true,
        expiresIn: 86400, // 24 hours
      });

      res.status(200).send({
        id: user.ID,
        username: user.USER_NAME,
        email: user.EMAIL,
        roleId: user.ROLE_ID,
        accessToken: token,
      });

      // var authorities = [];
      // user.getRoles().then((roles) => {
      //   for (let i = 0; i < roles.length; i++) {
      //     authorities.push("ROLE_" + roles[i].ROLE_NAME.toUpperCase());
      //   }
      //   res.status(200).send({
      //     id: user.ID,
      //     username: user.USER_NAME,
      //     email: user.EMAIL,
      //     roles: authorities,
      //     accessToken: token,
      //   });
      // });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};
