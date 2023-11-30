class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @markers = @posts.map do |post|
      {
        lat: post.user.latitude,
        lng: post.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {post: post})
      }
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.asker?
      welcome_message = "They would really appreciate some help with ##{@post.category}"
      button_text = "Help out!"
    else
      welcome_message = "They would love to help with ##{@post.category}"
      button_text = "Reach out!"
    end
    render locals: { welcome_message: welcome_message, button_text: button_text }
  end

end
