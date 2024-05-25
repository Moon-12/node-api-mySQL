const express = require("express");
const controller = require("../../controllers/header.controller");
const authJwt = require("../../middleware/authjwt");
const router = express.Router();

router.get("/:roleId", [
  //   authJwt.verifyToken,
  controller.fetchHeaderNamesByRoleId,
]);

module.exports = router;
