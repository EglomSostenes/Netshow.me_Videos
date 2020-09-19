require 'rails_helper'

RSpec.describe Video, type: :model do
  it "is invalid if name blank" do
    video = build(:video, name: "")
    expect(video).to_not be_valid
  end

  it "is invalid if url blank" do
    video = build(:video, url: "")
    expect(video).to_not be_valid
  end

  it "is invalid if user nil" do
    video = build(:video, user: nil)
    expect(video).to_not be_valid
  end

  it "is invalid if the url does not end with the extension .m3u8" do
    video = build(:video, url: FFaker::Internet.http_url.concat(".mp4"))
    expect(video).to_not be_valid
    video = build(:video)
    expect(video).to be_valid
  end

  it "It is invalid if the url does not match the url regex" do
    for i in 1..100
      video = build(:video, url: "ususus/aa.m3u8")
      expect(video).to_not be_valid
      video = build(:video)
      expect(video).to be_valid
    end
  end
end
