class Api::V1::MessagesController < ApplicationController
	def create	
		chat = Chat.find params[:chat_id]
		message = chat.messages.new(message_params)
    if message.save
    	render json: message, status: 201
    else
      render json: { errors: message.errors }, status: 422
    end
	end

	private

	def message_params
		params.require(:message).permit(:author, :body).merge(author: 'Unknown')
	end
end
