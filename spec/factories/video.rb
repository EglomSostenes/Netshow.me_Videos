FactoryBot.define do
    factory :video do
        association(:user)
        name {FFaker::Lorem.word}
        url {FFaker::Internet.http_url.concat(".m3u8")}
    end
end