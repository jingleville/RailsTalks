class Api::V1::ChatsController < ApplicationController
	def index
    render json: Chat.all
	end
end
