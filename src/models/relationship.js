const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('relationship', {
    enterpriseId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'enterprise',
        key: 'id'
      }
    },
    flagsId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'flags',
        key: 'id'
      }
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'user',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'relationship',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "enterpriseId" },
          { name: "userId" },
        ]
      },
      {
        name: "fk_enterprise_has_user_user1_idx",
        using: "BTREE",
        fields: [
          { name: "userId" },
        ]
      },
      {
        name: "fk_enterprise_has_user_enterprise1_idx",
        using: "BTREE",
        fields: [
          { name: "enterpriseId" },
        ]
      },
      {
        name: "fk_relationship_flags1_idx",
        using: "BTREE",
        fields: [
          { name: "flagsId" },
        ]
      },
    ]
  });
};
