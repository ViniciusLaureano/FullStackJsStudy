const { query } = require('../database');

class Product {
	constructor(productRow) {
		this.id = productRow.id;
		this.name = productRow.name;
		this.description = productRow.description;
		this.price = productRow.price;
		this.stockQuantity = productRow.stock_quantity;
		this.isActive = productRow.is_active;
		this.createdAt = productRow.created_at;
		this.updated_at = productRow.updated_at;
	}

	static async findAll() {
		const result = await query(`SELECT * FROM products;`);
		return result.rows.map((row) => new Product(row));
	}

	static async create({ name, description, price, stockQuantity, isActive }) {
		const result = await query(
			`
      INSERT INTO products (name, description, price, stock_quantity, is_active)
      VALUES ($1, $2, $3, $4, $5)
      RETURNING *
      `,
			[name, description, price, stockQuantity, isActive]
		);

		return new Product(result.rows[0]);
	}

	static async findById(id) {
    const result = await 
  }
}

module.exports = Product;
