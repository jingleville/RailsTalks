self.addEventListener("push", (event) => {
	let title = 'Title';
	let body = 'Body';
	let tag = 'TAg';

	event.waitUntil(
		self.registration.showNotification(title, {body,tag})
	)
});