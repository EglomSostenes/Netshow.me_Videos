class Video < ApplicationRecord
    validates :name, presence: true
    validates :url, presence: true
    validates :user, presence: true
    validate :verify_url

    belongs_to :user
    
    def verify_url
        unless self.url.end_with? ".m3u8"
            errors.add(:url, { url: "Deve-se ter a extensão .m3u8" })
        end
    end
end
