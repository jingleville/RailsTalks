class NotificationsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create	
		return update if current_user.notifications != []
			
		notification = current_user.notifications.build(
				endpoint: 	params[:endpoint],
				auth_key: 	params[:keys][:auth],
				p256dh_key: params[:keys][:p256dh]
			)

		if notification.save
			render json: notification
		else
			render json: notification.errors.full_messages
		end
	end

	def update
		notification = current_user.notifications.last

		notification.update(
				endpoint: 	params[:endpoint],
				auth_key: 	params[:keys][:auth],
				p256dh_key: params[:keys][:p256dh]
			)
		if notification.save
			render json: notification
		else
			render json: notification.errors.full_messages
		end
	end
end
