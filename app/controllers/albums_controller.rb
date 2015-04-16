class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def create
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
  end
end
