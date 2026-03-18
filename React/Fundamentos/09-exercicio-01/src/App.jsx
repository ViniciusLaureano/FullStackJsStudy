import react from '/react.png';

export default function App() {
	return (
		<div className="app">
			<img src={react} className="base" alt="" />
			<h1>React</h1>
			<p>A biblioteca para interfaces de usuário web e nativas</p>
			<div>
				<button>Aprenda React</button>
				<button>Referência da API</button>
			</div>

			<hr />

			<h2>Crie interfaces de usuário de componentes</h2>
			<p>React permite que você construa interfaces a partir de pedaõs individuais chamados componentes.</p>

			<hr />
			<h2>Escreva componentes com código e marcação</h2>
			<p>
				Componentes React são funções JavaScript. A sintaxe de marcação é chamada de JSX. É uma extensão de sintaxe JavaScript popularizada
				pelo React.
			</p>
		</div>
	);
}
