import express, { json } from "express";
import morgan from "morgan";
import cors from "cors";
import user_routes from "./routes/user.routes";
import enterprise_routes from "./routes/enterprise.routes";

require("dotenv").config();

export default class App {
	constructor() {
		this.app = express();
		this.settings();
		this.middlewares();
		this.routes();
	}

	settings() {
		this.app.set("port", 4000);
	}

	middlewares() {
		this.app.use(morgan("dev"));
		this.app.use(cors());
		this.app.use(json());
	}

	routes() {
		this.app.use("/user", user_routes);
		this.app.use("/enterprise", enterprise_routes);
	}

	async listen() {
		await this.app.listen(4000);
		console.log();
	}
}
