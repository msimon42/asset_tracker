class PriceData
  def self.stock_quotes(tickers)
    yf = YfService.new
    quotes = tickers.map do |ticker|
      data = yf.get_individual_stock(ticker)
      begin
        Quote.new(ticker, data['price']['regularMarketPrice']['raw'])
      rescue
        next
      end
    end
    return quotes
  end

  def self.crypto_quotes(tickers)
    resp = NomicsService.new.request_assets(tickers)
    return resp.map{|i| Quote.new(i['symbol'], i['price'])}
  end
end
