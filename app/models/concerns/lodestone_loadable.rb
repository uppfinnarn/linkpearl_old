require 'open-uri'

module LodestoneLoadable
  extend ActiveSupport::Concern
  
  included do
    def lodestone_load(*args, connection: Faraday.new)
      headers = {
        'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18"
      }
      
      url = lodestone_link(*args)
      res = connection.get url, headers: headers
      Nokogiri::HTML(res.body) { |config| config.nonet }
    end
  end
end
