import { Router } from "express";
import sequelize from "../database/database";
import { DataType } from "sequelize";
import Models from "../models/init-models";
import jwt from "jsonwebtoken";
import { v4 as uuidV4 } from "uuid";
require("dotenv").config();

const router = Router();
const models = Models(sequelize, DataType);

router
	.route("/:id")
	.get(async (req, res) => {
		const handleError = (error) => {
			res.status(400).json({ error });
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
				if (!user) throw "unaccessible";
				res.json(user);
			})
			.catch(handleError);
	})
	.delete(async (req, res) => {
		const handleError = (error) => {
			res.status(400).json({ error });
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
				res.json({ message: "success" });
			})
			.catch(handleError);
	});

router.route("/").post(async (req, res) => {
	const { nickname, public_key, email, mac } = req.body;
	const handleError = (error) => {
		console.log(error);
		res.status(400).json({ error });
	};

	await models.flags
		.create({})
		.then(async (flag) => {
			await models.user
				.create({
					nickname,
					email,
					public_key,
					flagsId: flag.id,
					levelId: 1,
				})
				.then(async (user) => {
					await models.device
						.create({
							mac,
							userId: user.id,
						})
						.then((device) => {
							const vinculation_token = generateToken({
								deviceId: device.id,
								userId: user.id,
							});
							const remote_key = uuidV4(process.env.SALT);
							res.json({
								id: user.id,
								vinculation_token,
								remote_key,
							});
						})
						.catch(handleError);
				})
				.catch(handleError);
		})
		.catch(handleError);
});

const generateToken = (data) => {
	return jwt.sign({ data }, process.env.JWT_SECRET, {
		expiresIn: 3600,
	});
};

export default router;
