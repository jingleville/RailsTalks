require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
  let(:user) { create(:user) }  # Assuming you have a User model and a user factory

  before do
    sign_in(user)  # Assuming you have authentication set up
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @chats' do
      chat = create(:chat)  # Assuming you have a Chat model and a chat factory
      get :index
      expect(assigns(:chats)).to include(chat)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new Chat to @chat' do
      get :new
      expect(assigns(:chat)).to be_a_new(Chat)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      chat = create(:chat)
      get :show, params: { id: chat.id }
      expect(response).to be_successful
    end

    it 'assigns the requested chat to @chat' do
      chat = create(:chat)
      get :show, params: { id: chat.id }
      expect(assigns(:chat)).to eq(chat)
    end

    it 'assigns @messages ordered by created_at' do
      chat = create(:chat)
      message1 = create(:message, chat: chat)
      message2 = create(:message, chat: chat)
      get :show, params: { id: chat.id }
      expect(assigns(:messages)).to eq([message2, message1])
    end

    it 'assigns a new message to @message' do
      chat = create(:chat)
      get :show, params: { id: chat.id }
      expect(assigns(:message)).to be_a_new(Message)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new chat' do
        chat_attributes = attributes_for(:chat)  # Assuming you have a chat factory
        expect {
          post :create, params: { chat: chat_attributes }
        }.to change(Chat, :count).by(1)
      end

      it 'redirects to the created chat' do
        chat_attributes = attributes_for(:chat)
        post :create, params: { chat: chat_attributes }
        expect(response).to redirect_to(Chat.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new chat' do
        chat_attributes = attributes_for(:chat, name: nil)
        expect {
          post :create, params: { chat: chat_attributes }
        }.not_to change(Chat, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        chat_attributes = attributes_for(:chat, name: nil)
        post :create, params: { chat: chat_attributes }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end