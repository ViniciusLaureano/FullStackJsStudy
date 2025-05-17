const pg = require('pg');

const db = new pg.Client({
	connectionString: 'postgresql://postgres:root@localhost:5432/onebitcode-class',
});

// console.log(db);

async function createTable() {
	await db.connect();

	const query = `
      CREATE TABLE IF NOT EXISTS "public"."Pokemon" (
      id SERIAL PRIMARY KEY,
      name VARCHAR(255),
      type VARCHAR(255)
    );
  `;

	const result = await db.query(query);
	console.log(result);

	await db.end();
}

createTable();
