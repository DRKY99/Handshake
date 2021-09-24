import { Router } from "express";
import sequelize from "../database/database";
import { DataType } from "sequelize";
import Models from "../models/init-models";
const router = Router();
const models = Models(sequelize, DataType);

router.route("/").post(async (req, res) => {
	const { userId, enterpriseId } = req.body;

	const handleError = (error) => {
		res.status(400).json({ error });
	};

	await models.flags
		.create({})
		.then(async (flag) => {
			await models.relationship
				.create({ userId, enterpriseId, flagsId: flag.id })
				.then(async (relationship) => {
					res.json({ relationship });
				})
				.catch(handleError);
		})
		.catch(handleError);
});

export default router;
