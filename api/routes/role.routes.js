const express = require("express");
const controller = require("../../controllers/role.controller");
const authJwt = require("../../middleware/authjwt");
const router = express.Router();

router.get("/get-role/:roleId", [authJwt.verifyToken, controller.getRoleById]);

router.get("/get-role", [controller.getAllRole]);
module.exports = router;
