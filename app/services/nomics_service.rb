class NomicsService
  include ServiceHelper

  def request_all_assets
    resp = get_request('/ticker')
    json_parse(resp)
  end

  def request_assets(assets)
    resp = get_request('/ticker', {ids: assets.join('%2C')})
    json_parse(resp)
  end

  private

  def connection
    Faraday.new(url: 'https://api.nomics.com/v1') do |f|
        f.adapter Faraday.default_adapter
        f.params[:key] = ENV['NOMICS_KEY']
    end
  end

  def get_request(endpoint, params=nil)
    response = connection.get(url, params)
    return response.body
  end
end
