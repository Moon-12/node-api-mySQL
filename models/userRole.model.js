// module.exports = (sequelize, Sequelize) => {
//   const UserRole = sequelize.define(
//     "UserRole",
//     {
//       ROLE_ID: {
//         type: Sequelize.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//         references: {
//           model: "Role",
//           key: "ROLE_ID",
//         },
//       },
//       USER_ID: {
//         type: Sequelize.INTEGER,
//         allowNull: false,
//         primaryKey: true,
//         references: {
//           model: "User",
//           key: "USER_ID",
//         },
//       },
//     },
//     {
//       tableName: "USER_ROLE", // Specify the table name explicitly
//       timestamps: false, // Disable createdAt and updatedAt fields
//     }
//   );

//   return UserRole;
// };
