import { Router } from "express";
import sequelize from "../database/database";
import { DataType } from "sequelize";
import Models from "../models/init-models";
const router = Router();
const models = Models(sequelize, DataType);

router
	.route("/:id")
	.get(async (req, res) => {
		const handleError = (error) => {
			console.log(error);
			res.status(400).json(error);
		};

		await models.user
			.findOne({
				where: {
					id: req.params.id,
				},
				attributes: ["id", "nickname", "public_key"],
				include: [
					{
						model: models.flags,
						as: "flag",
					},
				],
			})
			.then((user) => {
				res.json(user);
			})
			.catch(handleError);
	})
	.post(async (req, res) => {
		const { nickname, public_key } = req.body;

		const handleError = (error) => {
			console.log(error);
			res.status(400).json(error);
		};

		await models.user
			.findOne({})
			.then((user) => {
				res.json(user);
			})
			.catch(handleError);
	});

export default router;
