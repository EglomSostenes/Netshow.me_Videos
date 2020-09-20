require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  context 'When logged as user' do
    login_user

    let(:my_videos) { create_list(:video, 5, user: @user) }
    let(:no_my_videos) { create_list(:video, 10) }

    it '#GET - should return success' do
      get :index
      assert_response :success
      expect(assigns(:videos)).to match_array(my_videos + no_my_videos[0..1])
    end

    it '#GET - testing my_videos' do
      get :my_videos
      assert_response :success
      expect(assigns(:videos)).to match_array(my_videos)
    end

    it '#GET -Play Videos should return video' do
      video = create :video
      get :play, params: {id: video.id}
      assert_response :success
      expect(assigns(:video)).to eq(video)
    end

    it '#SHOW - should return success' do
      video = create :video, user_id: @user.id
      get :show, params: { id: video.id }

      assert_response :success
      expect(assigns(:video)).to eq(video)
    end

    it '#NEW - should return http code 302' do
      get :new

      assert_response :success
    end

    it '#CREATE - should return http code 302' do
      user = create :user
      video_params = attributes_for :video
      expect do
        post :create, params: { video: video_params, user_id: user.id }
      end.to change(Video, :count).by(1)
      expect(response).to redirect_to Video.last
    end

    it '#EDIT - should return http code 302' do
      video = create :video

      get :edit, params: { id: video.id }

      expect(response).to redirect_to videos_path
    end

    it '#UPDATE - should return http code 302' do
      video = create :video, user_id: @user.id
      video_params = { name: 'Change name' }

      put :update, params: { id: video.id, video: video_params }

      video.reload
      expect(video.name).to eq('Change name')
      expect(response).to redirect_to video
    end

    it 'should return success' do
      video = create :video, user_id: @user.id

      expect do
        delete :destroy, params: { id: video.id }
      end.to change(Video, :count).by(-1)

      expect(response).to redirect_to my_videos_videos_path
    end
  end
end
