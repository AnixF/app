class ChatMessage < ApplicationRecord
  validates :message, presence: true, length: { maximum: 100 }
end
