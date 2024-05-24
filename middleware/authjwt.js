const jwt = require("jsonwebtoken");
const secret = require("../env/secret.json");
verifyToken = (req, res, next) => {
  const token = req.headers["x-access-token"];
  if (!token) {
    res.status(403).json({
      message: "No token provided!",
    });
    //TODO check for expiration time
  }
  jwt.verify(token, secret.JWT_KEY, (err, decoded) => {
    if (err) {
      res.status(403).json({
        message: "Unauthorized",
      });
    } else {
      req.id = decoded.id;
      next();
    }
  });
};

// isStudent = (req, res, next) => {
//   User.findByPk(req.userId).then((user) => {
//     user.getRoles().then((roles) => {
//       for (let i = 0; i < roles.length; i++) {
//         if (roles[i].name === "student") {
//           next();
//           return;
//         }
//       }

//       res.status(403).send({
//         message: "Require student Role!",
//       });
//       return;
//     });
//   });
// };

// isFaculty = (req, res, next) => {
//   User.findByPk(req.userId).then((user) => {
//     user.getRoles().then((roles) => {
//       for (let i = 0; i < roles.length; i++) {
//         if (roles[i].name === "faculty") {
//           next();
//           return;
//         }
//       }

//       res.status(403).send({
//         message: "Require faculty Role!",
//       });
//     });
//   });
// };

// isStudentOrFaculty = (req, res, next) => {
//   User.findByPk(req.userId).then((user) => {
//     user.getRoles().then((roles) => {
//       for (let i = 0; i < roles.length; i++) {
//         if (roles[i].name === "student") {
//           next();
//           return;
//         }

//         if (roles[i].name === "faculty") {
//           next();
//           return;
//         }
//       }

//       res.status(403).send({
//         message: "Require student or faculty Role!",
//       });
//     });
//   });
// };

const authJwt = {
  verifyToken: verifyToken,
  //   isStudent: isStudent,
  //   isFaculty: isFaculty,
  //   isStudentOrFaculty: isStudentOrFaculty,
};
module.exports = authJwt;
