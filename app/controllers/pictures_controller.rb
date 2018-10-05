class PicturesController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]

  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

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
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

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
    @picture = Picture.find(params[:id])
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

end
