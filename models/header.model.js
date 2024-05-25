module.exports = (sequelize, DataTypes) => {
  const Header = sequelize.define(
    "Header",
    {
      ID: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      HEADER_NAME: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      ROUTE: {
        type: DataTypes.STRING,
      },
      CREATED_BY: {
        type: DataTypes.STRING,
      },
      CREATED_AT: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
      UPDATED_BY: {
        type: DataTypes.STRING,
      },
      UPDATED_AT: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      tableName: "HEADER",
      timestamps: false,
    }
  );
  return Header;
};
