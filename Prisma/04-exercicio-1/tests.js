const {
	createEvent,
	getAllEvents,
	getEventsByName,
	getEventsByDate,
	sellTicket,
} = require('./functions');

async function tests() {
	const result1 = await getAllEvents();
	console.log(result1);

	// await createEvent('Teatro 2', new Date('2025-08-30'), 3);

	// const result2 = await getEventsByName('Show 2');
	// console.log(result2);

	// const result3 = await getEventsByDate(new Date('2025-02-01'));
	// console.log(result3);

	// await sellTicket(5);
	// await sellTicket(5);
	// await sellTicket(5);
	process.exit(0);
}

tests();
