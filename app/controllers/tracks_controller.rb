class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def create
  end

  def new
    @track = Track.new
  end

  def edit
    @track = Track.find(params[:id])
  end

  def show
    @track = Track.find(params[:id])
  end

  def update
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
  end
end
