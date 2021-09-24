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
			res.status(400).json(error);
		};

		await models.user
			.findOne({
				where: {
					id: req.params.id,
					is_active: 1,
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
				if (!user) throw new Error();
				res.json(user);
			})
			.catch(handleError);
	})
	.delete(async (req, res) => {
		const handleError = (error) => {
			res.status(400).json(error);
		};

		await models.user
			.update(
				{ is_active: 0 },
				{
					where: {
						id: req.params.id,
					},
				}
			)
			.then((user) => {
				console.log(user);
				res.json({ message: "success" });
			})
			.catch(handleError);
	});

router.route("/").post(async (req, res) => {
	const { nickname, public_key } = req.body;

	const handleError = (error) => {
		res.status(400).json(error);
	};

	await models.flags
		.create({})
		.then(async (flag) => {
			await models.user
				.create({
					nickname,
					public_key,
					flagsId: flag.id,
					levelId: 1,
				})
				.then((user) => {
					res.json({ id: user.id });
				})
				.catch(handleError);
		})
		.catch(handleError);
});

export default router;
