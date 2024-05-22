//this model represents users table in mysql db
module.exports = (sequelize, Sequelize) => {
  const User = sequelize.define("USER", {
    USER_NAME: {
      type: Sequelize.STRING,
    },
    EMAIL: {
      type: Sequelize.STRING,
    },
    PASSWORD: {
      type: Sequelize.STRING,
    },
  });

  return User;
};
