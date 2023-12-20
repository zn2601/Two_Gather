class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :uikit]

  def home
  end

  def uikit
  end

  def dashboard
    @user = current_user
    @posts = Post.where(user: current_user)
    posts_reviews = @posts.map {|post| post.reviews}
    reviews = posts_reviews.flatten
    @recived_reviews = reviews.select {|review| review.user != current_user}


  end

end
