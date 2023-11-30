class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :reviews
  has_many :reviews_as_asker, through: :posts, source: :reviews
  geocoded_by :zipcode
  after_validation :geocode, if: :will_save_change_to_zipcode?
end
