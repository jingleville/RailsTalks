self.addEventListener("push", (event) => {
	let title = 'Title';
	let body = 'Body';
	let tag = 'TAg';
	console.log('Service worker works')

	event.waitUntil(
		self.registration.showNotification('Example')
	)
});