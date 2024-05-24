const express = require("express");
const { verifySignUp } = require("../../middleware");
const controller = require("../../controllers/auth.controller");
const router = express.Router();

router.post("/signup", [
  verifySignUp.checkDuplicateUsernameOrEmail,
  verifySignUp.checkRolesExisted,
  controller.signup,
]);

router.post("/login", controller.login);
// router.get("/:id", (req, res, next) => {
//   const id = req.params.id;
//   if (id === "special") {
//     res.status(200).json({
//       messgae: "you discovered special id",
//       id: id,
//     });
//   } else {
//     res.status(200).json({
//       message: "you passed an id",
//       id: id,
//     });
//   }
// });

module.exports = router;
