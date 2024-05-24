const db = require("../models");

const Role = db.role;

exports.getRoleById = async (req, res) => {
  const roleId = req.params.roleId;
  Role.findOne({
    where: {
      ID: roleId,
    },
  })
    .then((role) => {
      if (role) {
        res.status(200).json({ role: role.ROLE_NAME });
      } else {
        return res.status(404).send({ message: "Role Not found." });
      }
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};

exports.getAllRole = async (req, res) => {
  try {
    let rolesResponse = [];
    // Fetch all roles from the database using Sequelize
    const roles = await Role.findAll();

    for (let i = 0; i < roles.length; i++) {
      rolesResponse.push({ roleId: roles[i].ID, role: roles[i].ROLE_NAME });
    }
    res.status(200).json(rolesResponse);
  } catch (error) {
    // If an error occurs, send an error response
    console.error("Error fetching roles:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
