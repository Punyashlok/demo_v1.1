class Url < ApplicationRecord
    has_many :ip_infos
    validates :long_url, presence: true, length: { minimum: 30}
    
    before_create :generate_short_url, :sanitize
  
    def generate_short_url
      rand(36**8).to_s(36) #https://stackoverflow.com/questions/88311/how-to-generate-a-random-string-in-ruby
    end
  
    def sanitize
      long_url.strip!
      sanitize_url = self.long_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
      "http://#{sanitize_url}"
    end
  end
  
  # url Sanitize with regex - https://gist.github.com/lancejpollard/521267