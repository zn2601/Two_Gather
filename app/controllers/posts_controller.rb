class PostsController < ApplicationController


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
