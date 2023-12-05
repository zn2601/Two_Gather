class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user

  attr_accessor :mark_as_checked
  
end
