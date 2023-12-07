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
    @chatrooms = Chatroom.where(asker: current_user) + Chatroom.where(helper: current_user)
    @users = @chatrooms.map do |chatroom|
      if chatroom.asker == current_user
        chatroom.helper
      else
        chatroom.asker
      end
    end
  end

  def create
    @chatrooms = Chatroom.where(asker: current_user) + Chatroom.where(helper: current_user)
    @review = Review.new(review_params)
    @review.post = @post
    @review.user = current_user if @post.user != current_user

    if @review.save
      if @review.mark_as_checked
        @post.update(solved: true)
      end
      @send_review_user = current_user if @review.user != current_user
      @chatroom = common_chat(@chatrooms, @review.post.user)
      Message.create(
        user_id: @send_review_user.id,
        content: "I just gave you a review for '#{@post.title.capitalize}'! Thanks for reaching out.",
        chatroom_id: @chatroom.id
      )
      redirect_to chatroom_path(@chatroom), notice: "Review created successfully."
    else
      render :new, alert: "Review could not be created."
    end
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def review_params
    params.require(:review).permit(:asker_rating, :helper_rating, :asker_comment, :helper_comment, :mark_as_checked, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def common_chat(chatrooms, user)
    @chatrooms.find { |chat| chat.asker == user || chat.helper == user }
  end

end
