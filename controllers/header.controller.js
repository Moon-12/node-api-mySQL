const db = require("../models");

const Header = db.header;
const RoleHeader = db.roleHeader;
exports.fetchHeaderNamesByRoleId = async (req, res, next) => {
  const roleId = req.params.roleId;
  console.log("roleid", roleId);

  try {
    const headers = await Header.findAll({
      include: [
        {
          model: RoleHeader,
          where: { ROLE_ID: roleId },
          attributes: [], // We don't need any attributes from the join table
        },
      ],
      attributes: ["HEADER_NAME", "ID", "ROUTE"], // We only need the HEADER_NAME attribute
    });
    let responseHeader = [];
    headers.map((header) => {
      responseHeader.push({
        header_name: header.HEADER_NAME,
        id: header.ID,
        route: header.ROUTE,
      });
    });
    return res.status(200).json({ message: "success", data: responseHeader });
  } catch (error) {
    console.error("Error fetching header names:", error);
    return res.status(200).json({ error: error });
  }
};
