class PriceData
  def stock_quotes(tickers)

  end

  def crypto_quotes(tickers)
    resp = NomicsService.new.request_assets(tickers)
    return resp.map{|i| Quote.new(i['symbol'], i['price'])}
  end
end
