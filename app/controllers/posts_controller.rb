class PostsController < ApplicationController

  def index
    Mapbox.access_token = ENV['MAPBOX_API_KEY']

    @posts = Post.all
    @markers = @posts.map do |post|
      {
        lat: post.user.latitude,
        lng: post.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {post: post})
      }
    end
    if params[:query].present?
      placenames = Mapbox::Geocoder.geocode_forward(params[:query])
      @center = {
        lat: placenames[0]["features"][0]["center"][1],
        lng: placenames[0]["features"][0]["center"][0],
        zoom: 13
      }
    else
      @center = { lat: 52.341199, lng: 4.856931, zoom: 9 }
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.asker?
      welcome_message = "They would really appreciate some help with "
      button_text = "Help out!"
    else
      welcome_message = "They would love to help with "
      button_text = "Reach out!"
    end
    render locals: { welcome_message: welcome_message, button_text: button_text }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path(@post), notice: "Post created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category, :asker, photos: [])
  end

end
