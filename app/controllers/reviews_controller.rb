class ReviewsController < ApplicationController

before_action :set_post, only: %i[new create]

def index
  @post = Post.find(params[:post_id])
  @reviews = @post.reviews
end

  def new
    @review = Review.new
    @post = Post.find(params[:post_id])
    @asker = @post.user
  end

  def create
    @review = Review.new(review_params)
    @review.post = @post
    @review.user = @user
    if @review.save!
      # Update the solved attribute of the post based on the mark_as_checked parameter
      if @review.mark_as_checked
        @post.update(solved: true)
      end
      redirect_to post_path(@post), notice: "Review created successfully."
    else
      render :new, alert: "Review could not be created."
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def review_params
    params.require(:review).permit(:rating, :asker_comment, :helper_comment, :mark_as_checked)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
