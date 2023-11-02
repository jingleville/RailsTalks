import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

Notification.requestPermission();
const vapidPublicKey = new Uint8Array(<%= Base64.urlsafe_decode64(Rails.application.credentials.dig(:webpush, :private_key)).bytes %>);
if (navigator.serviceWorker) {
navigator.serviceWorker.register('/service_worker.js')
.then(function(reg) {
  console.log('Service worker change, registered the service worker');
});
} else {
console.error('Service worker is not supported in this browser');
}

navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
serviceWorkerRegistration.pushManager
.subscribe({
  userVisibleOnly: true,
  applicationServerKey: vapidPublicKey
});
});

const vapidPublicKey = new Uint8Array(<%= Base64.urlsafe_decode64(Rails.application.credentials.dig(:webpush, :private_key)).bytes %>);

navigator.serviceWorker.register('/service_worker.js')
navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
	serviceWorkerRegistration.pushManager.subscribe({
		userVisibleOnly: true,
		applicationServerKey: vapidPublicKey
	});
	
});