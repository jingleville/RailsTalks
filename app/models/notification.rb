class Notification < ApplicationRecord
	belongs_to :user

	def notificate(message)
		WebPush.payload_send(
			message:  message, 
			endpoint: endpoint,
			p256dh:   p256dh_key,
			auth: 	  auth_key,
			vapid: {
				private_key: Rails.application.credentials.dig(:webpush, :private_key), 
				public_key:  Rails.application.credentials.dig(:webpush, :public_key)
			})
	end
end

