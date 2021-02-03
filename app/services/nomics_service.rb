class NomicsService
  include ServiceHelper
  private

  def connection
    Faraday.new(url: 'https://api.nomics.com/v1') do |f|
        f.adapter Faraday.default_adapter
        f.params[:key] = ENV['NOMICS_KEY']
    end
  end
end
