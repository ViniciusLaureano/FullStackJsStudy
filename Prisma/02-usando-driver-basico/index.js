const pg = require('pg');

const db = new pg.Client({
	connectionString: 'postgresql://postgres:root@localhost:5432/onebitcode-class',
});

// console.log(db);

async function insertPokemon() {
	await db.connect();

	const pokemon = { name: 'Quaxly', type: 'Água' };
	const result = await db.query(`INSERT INTO "Pokemon" (name, type) VALUES ($1, $2);`, [
		pokemon.name,
		pokemon.type,
	]);
	console.log(result);

	await db.end();
}

insertPokemon();
