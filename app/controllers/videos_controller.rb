class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit, :update, :destroy, :play]
  before_action :authorized?, only: [:edit, :destroy, :show]

  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).order("score DESC").paginate(page: params[:page], per_page: 7)
  end

  def my_videos
    @videos = current_user.videos.order("score DESC").paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def play
    @video.update_attribute(:score, @video.score + 1)
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = current_user.videos.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: t('create_ok') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: t('update_ok') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to my_videos_videos_url, notice: t('destroy_ok') }
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def authorized?
    unless @video.user == current_user
      redirect_to videos_url, alert: t('permited_not')
    end
  end

  def video_params
    params.require(:video).permit(:name, :url)
  end
end
