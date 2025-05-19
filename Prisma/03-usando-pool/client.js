const { Client } = require('pg');

const client = new Client({
	connectionString: 'postgresql://postgres:root@localhost:5432/onebitcode-class',
});

async function openConnection() {
	await client.connect();

	const result = await client.query('SELECT 1 + 1 AS soma;');
	console.log(result.rows);

	setTimeout(() => {
		client.end();
		console.log('Fechando conexão...');
	}, 5000);
}

openConnection();

// Tentar abrir uma segunda conexão com o cliente resulta em erro
openConnection();
