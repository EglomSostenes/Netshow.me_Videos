class Video < ApplicationRecord
    validates :name, presence: true
    validates :url, presence: true
    validates :user, presence: true
    validate :verify_extension
    validate :url_valid?

    belongs_to :user
    
    def verify_extension
        if self.url
            unless self.url.end_with? ".m3u8"
                errors.add(:url, { url: "Deve-se ter a extensão .m3u8" })
            end
        end
    end

    def url_valid?
        if self.url
            unless self.url.match(/^(ftp|http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix)
                errors.add(:url, {url: "URL inválida"})
            end
        end
    end
end
