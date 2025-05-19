const { Pool } = require('pg');

const pool = new Pool({
	connectionString: 'postgresql://postgres:root@localhost:5432/onebitcode-class',
	max: 2,
});

async function openConnection() {
	const result = await pool.query('SELECT 1 + 1 AS soma;');
	console.log(result.rows);

	setTimeout(() => {
		console.log('Fechando conexão...');
	}, 5000);
}

openConnection();
openConnection();
// Abrir uma nova conexão não funciona imediatamente, mas não lança erro
// Quando uma conexão é liberada na pool, uma nova pode ser aberta
openConnection();
