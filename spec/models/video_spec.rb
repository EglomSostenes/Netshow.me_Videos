require 'rails_helper'

RSpec.describe Video, type: :model do

  it "is valid factory_bot build" do
    video = build(:video, user: create(:user))
    expect(video).to be_valid
  end

  it "is invalid if name blank" do
    video = build(:video, name: "", user: create(:user))
    expect(video).to_not be_valid
  end

  it "is invalid if url blank" do
    video = build(:video, url: "", user: create(:user))
    expect(video).to_not be_valid
  end

  it "is invalid if user nil" do
    video = build(:video, user: nil)
    expect(video).to_not be_valid
  end

  it "is invalid if the url does not end with the extension .m3u8" do
    video = build(:video, url: FFaker::Internet.http_url.concat(".mp4"), user: create(:user))
    expect(video).to_not be_valid
  end

  it "It is invalid if the url does not match the url regex" do
    video = build(:video, url: "ususus/aa.m3u8", user: create(:user))
    expect(video).to_not be_valid
  end
end
