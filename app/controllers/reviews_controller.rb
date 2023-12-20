class ReviewsController < ApplicationController

# This is a before action that sets the post for the new and create actions
before_action :set_post, only: %i[new create]

  # This is the index action that shows all the reviews for a post. For testing purpose only
def index
  @post = Post.find(params[:post_id])
  @reviews = @post.reviews
end

  # This is the new action that creates a new review object
  def new
    # Initialize a new review
    @review = Review.new
    # Find the post by its id from the params
    @post = Post.find(params[:post_id])
    # Find the user that created the post
    @asker = @post.user
    # Find the user that is currently logged in
    @chatrooms = Chatroom.where(asker: current_user) + Chatroom.where(helper: current_user)
    # Get all the users who are in the chatrooms with the current use
    @users = @chatrooms.map do |chatroom|
      # If the current user is the asker, get the helper
      if chatroom.asker == current_user
        chatroom.helper
      # Otherwise, get the asker
      else
        chatroom.asker
      end
    end
  end

   # This is the create action that saves a new review to the database
  def create
    # Get all the chatrooms where the current user is either the asker or the helper
    @chatrooms = Chatroom.where(asker: current_user) + Chatroom.where(helper: current_user)
    # Initialize a new review with the parameters from the form
    @review = Review.new(review_params)
    # Assign the post to the review
    @review.post = @post
    # Assign the current user to the review if they are not the post user
    @review.user = current_user if @post.user != current_user

    # If the review is saved successfully
    if @review.save
      # If the review is marked as checked
      if @review.mark_as_checked
        # Update the post status to solved (with that action the post will be removed from the post index page)
        @post.update(solved: true)
      end
      # If the current user is not the post user, assign the current user to the send review user
      @send_review_user = current_user if @review.user != current_user
      # Find the common chatroom between the current user and the post user
      @chatroom = common_chat(@chatrooms, @review.post.user)
      # Create a new message in the chatroom
      Message.create(
        user_id: @send_review_user.id,
        content: "I just gave you a review for '#{@post.title.capitalize}'! Thanks for reaching out.",
        chatroom_id: @chatroom.id
      )
      # Redirect to the chatroom path with a notice
      redirect_to chatroom_path(@chatroom), notice: "Review created successfully."
    else
      # Render the new template with an alert
      render :new, alert: "Review could not be created."
    end
  end


  private

  # This is a private method that sets the post by its id from the params
  def set_post
    @post = Post.find(params[:post_id])
  end

  # This is a private method that returns the review parameters from the form
  def review_params
    params.require(:review).permit(:asker_rating, :helper_rating, :asker_comment, :helper_comment, :mark_as_checked, :user_id)
  end

  # This is a private method that sets the user by its id from the params
  def set_user
    @user = User.find(params[:user_id])
  end

  # This is a private method that returns the common chatroom between the current user and another user
  def common_chat(chatrooms, user)
    @chatrooms.find { |chat| chat.asker == user || chat.helper == user }
  end

end
