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
			res.status(400).json({ error });
		};

		await models.enterprise
			.findOne({
				where: {
					id: req.params.id,
					is_active: 1,
				},
			})
			.then((enterprise) => {
				if (!enterprise) throw "unaccessible";
				res.json(enterprise);
			})
			.catch(handleError);
	})
	.delete(async (req, res) => {
		const handleError = (error) => {
			res.status(400).json({ error });
		};

		await models.enterprise
			.update(
				{ is_active: 0 },
				{
					where: {
						id: req.params.id,
					},
				}
			)
			.then((enterprise) => {
				res.json({ message: "success" });
			})
			.catch(handleError);
	});

router.route("/").post(async (req, res) => {
	const { name, public_key, contact_data, ceo } = req.body;

	const handleError = (error) => {
		res.status(400).json({ error });
	};

	await models.enterprise
		.create({ name, public_key, contact_data, ceo })
		.then(async (enterprise) => {
			res.json({ id: enterprise.id });
		})
		.catch(handleError);
});

export default router;
