class MessagesController < ApplicationController
	def create	
		@chat = Chat.find params[:chat_id]
		@message = @chat.messages.new(message_params)
    if @message.save
    	redirect_to @chat
    else
      redirect_to root_path
    end
	end

	private

	def message_params
		params.require(:message).permit(:author, :body)
	end

end
