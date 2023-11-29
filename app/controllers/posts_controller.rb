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
end
