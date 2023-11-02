// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

const vapidPublicKey = new Uint8Array(<%= Base64.urlsafe_decode64(Rails.application.credentials.dig(:webpush, :private_key)).bytes %>);

navigator.serviceWorker.register('/service_worker.js')
console.log('Hello');
navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
	console.log('Hello');
	serviceWorkerRegistration.pushManager.subscribe({
		userVisibleOnly: true,
		applicationServerKey: vapidPublicKey
	});
	
});