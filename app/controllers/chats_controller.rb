class ChatsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@chats = Chat.all
	end

	def new
		@chat = Chat.new
	end

	def show
		@chat = Chat.find params[:id]
		@messages = @chat.messages
		@message = @chat.messages.new
	end

	def create
    @chat = Chat.new(chat_params)

    if @chat.save
      redirect_to @chat
    else
      render :new, status: :unprocessable_entity
    end
	end

	private

	def chat_params
		params.require(:chat).permit(:name)
	end
end
