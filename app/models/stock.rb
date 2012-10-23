class Stock < ActiveRecord::Base
  attr_accessible :price, :quantity, :symbol
  
  # ---- validations ---- #
  
  validates :symbol,  :presence => true, :uniqueness => true,
                    :length => {:minimum => 1, :maximum => 5}
  validates :price, :presence => true, :numericality => { :greater_than => 0 },
                    :length => {:minimum => 1, :maximum => 10}  
  validates :quantity, :presence => true, :numericality => { :only_integer => true,  :greater_than => 0},
                    :length => {:minimum => 1, :maximum => 10}                                      
  validate  :symbol_must_exist 
                    
  def symbol_must_exist  # Yahoo returns an 'N/A' in the Ask and Bid fields if bogus stock symbol requested
     if CSV.parse_line(YahooStock.find_by_symbol(symbol).parsed_response)[1] == 'N/A' 
       errors.add('symbol', 'does not exist') 
     end
  end
   
  def to_label   # Use as Form Label for subform
    "Stock"
  end  

  # ---- virtual fields ---- #
  # CSV.parse_line(YahooStock.find_by_symbol(symbol).parsed_response) 
  # returns an Array consisting of Stock Symbol, Ask Price, Bid Price
  
  def stockname
    "#{CSV.parse_line(YahooStock.find_by_symbol(symbol).parsed_response)[0]}"
  end
  
  def yahoo_ask_price
     "#{CSV.parse_line(YahooStock.find_by_symbol(symbol).parsed_response)[1].to_f}"
  end
  
  def yahoo_value
     "#{CSV.parse_line(YahooStock.find_by_symbol(symbol).parsed_response)[1].to_f * quantity}"
  end
  
  def purchased_value
    "#{price * quantity}"
  end
  
  def difference
    "#{yahoo_value.to_f - purchased_value.to_f}"
  end
  
end


