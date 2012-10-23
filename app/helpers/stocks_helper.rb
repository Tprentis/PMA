module StocksHelper     
  
  # Format Currency Fields as :currency
  
  def price_column(stock)
    number_to_currency(stock.price)
  end   
  
  def purchased_value_column(stock)
    number_to_currency(stock.purchased_value)
  end
  
  def yahoo_ask_price_column(stock)
    number_to_currency(stock.yahoo_ask_price)
  end
  
  def yahoo_value_column(stock)
    number_to_currency(stock.yahoo_value)
  end
  
  def difference_column(stock)
    number_to_currency(stock.difference)
  end
  
end

