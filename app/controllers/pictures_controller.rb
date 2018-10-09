class PicturesController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, except: [:show, :index]

  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
  end

  def show
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user_id = current_user[:id]

    if @picture.save
      redirect_to "/pictures"
    else
      render :new
    end

  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def update
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to "/pictures"
  end

  def old_pictures
    @old_pictures = Picture.created_month_before
  end

  def created_in_year
    @year = params[:id]
    @pictures = Picture.pictures_created_in_year(params[:id])
  end


  def load_picture
    @picture = Picture.find(params[:id])
  end

end
