import Sequelize from "sequelize";
require("dotenv").config();

const sequelize = new Sequelize(
	process.env.DB_SCHEMA,
	process.env.DB_USER,
	process.env.DB_PASS,
	{
		host: process.env.DB_HOST,
		dialect: "mysql",
		pool: {
			max: 5,
			min: 0,
			require: 30000,
			idle: 10000,
		},
		logging: false,
	}
);

export default sequelize;
