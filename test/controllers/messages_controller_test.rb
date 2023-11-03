require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }  # Assuming you have a User model and a user factory
  let(:chat) { create(:chat) }  # Assuming you have a Chat model and a chat factory

  before do
    sign_in(user)  # Assuming you have authentication set up
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new message' do
        message_attributes = attributes_for(:message)  # Assuming you have a message factory
        expect {
          post :create, params: { chat_id: chat.id, message: message_attributes }
        }.to change(Message, :count).by(1)
      end

      it 'redirects to the chat' do
        message_attributes = attributes_for(:message)
        post :create, params: { chat_id: chat.id, message: message_attributes }
        expect(response).to redirect_to(chat)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new message' do
        message_attributes = attributes_for(:message, body: nil)  # Assuming you have a message factory
        expect {
          post :create, params: { chat_id: chat.id, message: message_attributes }
        }.not_to change(Message, :count)
      end

      it 'redirects to the chat with unprocessable_entity status' do
        message_attributes = attributes_for(:message, body: nil)
        post :create, params: { chat_id: chat.id, message: message_attributes }
        expect(response).to redirect_to(chat)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end