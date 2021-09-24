const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('flags', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 0
    },
    phone: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 0
    },
    email: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 0
    },
    location: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 0
    },
    other: {
      type: DataTypes.TINYINT,
      allowNull: false,
      defaultValue: 0
    }
  }, {
    sequelize,
    tableName: 'flags',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "id_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
    ]
  });
};
