const { Pool } = require('pg');

const pool = new Pool({
	connectionString: 'postgresql://postgres:root@localhost:5432/onebitcode-class',
});

async function query(queryString, params, callback) {
	return pool.query(queryString, params, callback);
}

module.exports = { query };
