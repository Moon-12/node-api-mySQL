const db = require("../models");

const Menu = db.menu;
const HeaderMenu = db.headerMenu;
exports.fetchMenuNamesByHeaderId = async (req, res, next) => {
  const headerId = req.params.headerId;
  console.log("roleid", headerId);

  try {
    const menus = await Menu.findAll({
      include: [
        {
          model: HeaderMenu,
          where: { HEADER_ID: headerId },
          attributes: [], // We don't need any attributes from the join table
        },
        {
          model: Menu,
          as: "SubMenus",
          include: [
            {
              model: Menu,
              as: "SubMenus", // Fetch submenus recursively
            },
          ],
        },
      ],
      attributes: ["MENU_NAME", "ID"], // We only need the HEADER_NAME attribute
    });
    let responseMenu = [];
    // menus.map((header) => {
    //   responseHeader.push({
    //     header_name: header.HEADER_NAME,
    //     id: header.ID,
    //     route: header.ROUTE,
    //   });
    // });
    return res.status(200).json({ message: "success", data: menus });
  } catch (error) {
    console.error("Error fetching header names:", error);
    return res.status(200).json({ error: error });
  }
};
