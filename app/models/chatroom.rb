class Chatroom < ApplicationRecord
  belongs_to :asker, class_name: 'User'
  belongs_to :helper, class_name: 'User'
  has_many :messages
end
