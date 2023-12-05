class Chatroom < ApplicationRecord
  belongs_to :asker
  belongs_to :helper
end
