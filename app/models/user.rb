class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :askser_chatrooms, class_name: 'Chatrooms', through: :messages, foreign_key: 'asker_id'
  has_many :helper_chatrooms, class_name: 'Chatroom', through: :messages, foreign_key: 'helper_id'
  has_one_attached :photo
  has_many :posts
  has_many :reviews
  has_many :reviews_as_asker, through: :posts, source: :reviews
  geocoded_by :zipcode
  after_validation :geocode, if: :will_save_change_to_zipcode?

    # def average_rating
    #   reviews_as_asker.average(:rating).to_f.round(2)
    # end
end
