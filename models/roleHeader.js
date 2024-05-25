// models/role_header.js
module.exports = (sequelize, DataTypes) => {
  const RoleHeader = sequelize.define(
    "RoleHeader",
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
      ROLE_ID: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "Role",
          key: "ID",
        },
        primaryKey: true,
      },
      CREATED_BY: {
        type: DataTypes.STRING,
      },
      CREATED_AT: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      tableName: "ROLE_HEADER",
      timestamps: false,
    }
  );

  return RoleHeader;
};
