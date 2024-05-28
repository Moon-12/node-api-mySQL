const express = require("express");
const controller = require("../../controllers/menu.controller");
const authJwt = require("../../middleware/authjwt");
const router = express.Router();

router.get("/:headerId", [
  //   authJwt.verifyToken,
  controller.fetchMenuNamesByHeaderId,
]);

module.exports = router;
