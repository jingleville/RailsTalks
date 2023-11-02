console.log('hello from the service worker')

self.addEventListener('push', (event) => {
  // Get the push message
  console.log(event);
  var message = (event.data && event.data.text());

  // Display a notification
  event.waitUntil(self.registration.showNotification(message, {sound: '../notification.mp3'}));
});