// models/header_menu.js
module.exports = (sequelize, DataTypes) => {
  const HeaderMenu = sequelize.define(
    "HeaderMenu",
    {
      HEADER_ID: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "Header",
          key: "ID",
        },
        primaryKey: true,
      },
      MENU_ID: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "Menu",
          key: "ID",
        },
        primaryKey: true,
      },
      CREATED_BY: {
        type: DataTypes.STRING(255),
      },
      CREATED_AT: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      tableName: "HEADER_MENU",
      timestamps: false,
    }
  );

  //   // Define associations if necessary
  //   HeaderMenu.associate = (models) => {
  //     HeaderMenu.belongsTo(models.Header, { foreignKey: "HEADER_ID" });
  //     HeaderMenu.belongsTo(models.Menu, { foreignKey: "MENU_ID" });
  //   };

  return HeaderMenu;
};
