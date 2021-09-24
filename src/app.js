import express, { json } from "express";
import morgan from "morgan";
import cors from "cors";
import _routes from "./routes/user.routes";

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
		this.app.use("/user", _routes);
	}

	async listen() {
		await this.app.listen(4000);
		console.log();
	}
}
