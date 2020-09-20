class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit, :update, :destroy, :play]
  before_action :authorized?, only: [:edit, :destroy, :show]

  # GET /videos
  # GET /videos.json
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).order("score DESC").paginate(page: params[:page], per_page: 7)
  end

  def my_videos
    @videos = Video.where(user: current_user).order("score DESC").paginate(page: params[:page], per_page: 7)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  def play
    @video.score = @video.score + 1
    @video.save
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to my_videos_videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def authorized?
      unless @video.user == current_user
        redirect_to videos_url, notice: "Você não tem permissão para alterar ou destruir este vídeo!"
      end
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:name, :url, :user_id)
    end
end
