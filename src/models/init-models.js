var DataTypes = require("sequelize").DataTypes;
var _device = require("./device");
var _enterprise = require("./enterprise");
var _flags = require("./flags");
var _level = require("./level");
var _relationship = require("./relationship");
var _user = require("./user");

function initModels(sequelize) {
  var device = _device(sequelize, DataTypes);
  var enterprise = _enterprise(sequelize, DataTypes);
  var flags = _flags(sequelize, DataTypes);
  var level = _level(sequelize, DataTypes);
  var relationship = _relationship(sequelize, DataTypes);
  var user = _user(sequelize, DataTypes);

  enterprise.belongsToMany(user, { as: 'userId_users', through: relationship, foreignKey: "enterpriseId", otherKey: "userId" });
  user.belongsToMany(enterprise, { as: 'enterpriseId_enterprises', through: relationship, foreignKey: "userId", otherKey: "enterpriseId" });
  relationship.belongsTo(enterprise, { as: "enterprise", foreignKey: "enterpriseId"});
  enterprise.hasMany(relationship, { as: "relationships", foreignKey: "enterpriseId"});
  relationship.belongsTo(flags, { as: "flag", foreignKey: "flagsId"});
  flags.hasMany(relationship, { as: "relationships", foreignKey: "flagsId"});
  user.belongsTo(flags, { as: "flag", foreignKey: "flagsId"});
  flags.hasMany(user, { as: "users", foreignKey: "flagsId"});
  user.belongsTo(level, { as: "level", foreignKey: "levelId"});
  level.hasMany(user, { as: "users", foreignKey: "levelId"});
  device.belongsTo(user, { as: "user", foreignKey: "userId"});
  user.hasMany(device, { as: "devices", foreignKey: "userId"});
  relationship.belongsTo(user, { as: "user", foreignKey: "userId"});
  user.hasMany(relationship, { as: "relationships", foreignKey: "userId"});

  return {
    device,
    enterprise,
    flags,
    level,
    relationship,
    user,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
