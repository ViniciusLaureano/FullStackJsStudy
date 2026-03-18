const Product = require('../models/Product');

const productsController = {
	index: async (req, res) => {
		const products = await Product.findAll();
		res.json(products);
	},

	show: async (req, res) => {},

	create: async (req, res) => {
		const newProduct = await Product.create(req.body);
		res.status(201).json(newProduct);
	},

	update: async (req, res) => {},

	delete: async (req, res) => {},
};

module.exports = productsController;
