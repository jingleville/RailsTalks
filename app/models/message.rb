class Message < ApplicationRecord
  belongs_to :chat
  after_create_commit :notificate

  private
  def notificate
    broadcast_append_to self.chat
    Notification.all.each do |notification| 
      notification.notificate("new message at #{self.chat.name} HAas")
    end
  end
end
