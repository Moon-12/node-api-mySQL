//this model represents roles table in mysql db
module.exports = (sequelize, Sequelize) => {
  const Role = sequelize.define("ROLE", {
    ROLE_ID: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    ROLE_NAME: {
      type: Sequelize.STRING,
    },
  });

  return Role;
};
