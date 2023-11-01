class Message < ApplicationRecord
  belongs_to :chat
  after_create_commit {broadcast_append_to self.chat}
end
