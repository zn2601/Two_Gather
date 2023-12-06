class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) # params[:id] is the user id from the URL
    @reviews = @user.reviews.order(created_at: :asc) # reviews received by the user as a helper
    @reviews_as_asker = @user.reviews_as_asker.order(created_at: :asc) # reviews received by the user as an asker
  end
end
