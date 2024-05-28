// models/menu.js

module.exports = (sequelize, DataTypes) => {
  const Menu = sequelize.define(
    "Menu",
    {
      PARENT_ID: {
        type: DataTypes.INTEGER,
        allowNull: true, // Allow null for root level menus
        references: {
          model: "Menu", // Reference to the same model
          key: "ID",
        },
      },
      ID: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      MENU_NAME: {
        type: DataTypes.STRING(255),
        allowNull: false,
      },
      CREATED_BY: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      CREATED_AT: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
        allowNull: false,
      },
      UPDATED_BY: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      UPDATED_AT: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
        allowNull: false,
      },
    },
    {
      tableName: "MENU",
      timestamps: false, // Disable automatic timestamp fields (createdAt, updatedAt)
    }
  );
  return Menu;
};
