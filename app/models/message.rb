class Message < ApplicationRecord
  belongs_to :chat
  after_create_commit :notificate

  private
  def notificate
    broadcast_append_to self.chat
  end
end
