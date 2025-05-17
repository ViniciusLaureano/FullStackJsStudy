const pg = require('pg');

const connectionString = 'postgresql://postgres:root@localhost:5432/onebitcode-class';
const db = new pg.Client({ connectionString });

async function selectPokemon() {
	await db.connect();

	const query = `SELECT * FROM "public"."Pokemon";`;
	const result = await db.query(query);
	console.log(result);
	console.log(result.rows);

	await db.end();
}

selectPokemon();
