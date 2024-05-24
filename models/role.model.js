//this model represents roles table in mysql db
module.exports = (sequelize, Sequelize) => {
  const Role = sequelize.define(
    "Role",
    {
      ID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
      },
      ROLE_NAME: {
        type: Sequelize.STRING,
        defaultValue: null,
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
    },
    {
      tableName: "ROLE", // Specify the table name explicitly
      timestamps: false, // Disable createdAt and updatedAt fields
    }
  );

  return Role;
};
