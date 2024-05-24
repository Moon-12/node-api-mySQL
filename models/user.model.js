module.exports = (sequelize, Sequelize) => {
  const User = sequelize.define(
    "User",
    {
      ID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      USER_NAME: {
        type: Sequelize.STRING,
      },
      EMAIL: {
        type: Sequelize.STRING,
      },
      PASSWORD: {
        type: Sequelize.STRING,
      },
      CREATED_BY: {
        type: Sequelize.STRING,
      },
      CREATED_AT: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
      },
      UPDATED_BY: {
        type: Sequelize.STRING,
      },
      UPDATED_AT: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
        onUpdate: Sequelize.literal("CURRENT_TIMESTAMP"),
      },
      ROLE_ID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: "Role",
          key: "ID",
        },
      },
    },
    {
      tableName: "USER", // Specify the table name explicitly
      timestamps: false, // Disable createdAt and updatedAt fields
    }
  );

  return User;
};
