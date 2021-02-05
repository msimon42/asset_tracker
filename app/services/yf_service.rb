class YFService

  private
    def connection
      Faraday.new(url: 'https://apidojo-yahoo-finance-v1.p.rapidapi.com') do
        f.headers['x-rapidapi-key'] = ENV['YF_KEY']
        f.headers['x-rapidapi-host'] = ENV['YF_HOST']
        f.adapter Faraday.default_adapter
      end
    end

    def get_request(endpoint, params=nil)
      response = connection.get(endpoint, params)
      return response.body
    end
end
