class MessagesController < ApplicationController
	def create	
		chat = Chat.find params[:chat_id]
		message = @chat.messages.new(message_params)
    if message.save
    	redirect_to chat
    else
      redirect_to chat, status: :unprocessable_entity
    end
	end

	private

	def message_params
		params.require(:message).permit(:author, :body).merge(author: current_user.email)
	end
end
