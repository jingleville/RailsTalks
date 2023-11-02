class ApiController < ApplicationController
	def get_chats
		@chats = Chat.all
		render json: @chats
	end

	def send_message
		@chat = Chat.find params[:chat_id]
		@message = @chat.messages.new(message_params)
    @message.save!
	end

	private
	def message_params
		params[:message][:author] = 'message created via API'
		params.require(:message).permit(:author, :body)
	end
end
