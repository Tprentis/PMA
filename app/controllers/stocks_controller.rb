class StocksController < ApplicationController
 before_filter :authenticate_user!

 active_scaffold :stock do |config|

     # list these columns
     config.columns = [:symbol, :stockname, :price, :quantity, :purchased_value, :yahoo_ask_price, :yahoo_value, :difference]
    
     # config.columns for create and update = [:symbol, :price, :quantity]
     config.create.columns = [:symbol, :price, :quantity] 
     config.update.columns = [:symbol, :price, :quantity]

   
     # use css_class = 'numeric' for right justification of virtual numeric columns (i.e. sums, other calculated amounts, etc.)
     config.columns[:purchased_value].css_class = 'numeric'
     config.columns[:yahoo_ask_price].css_class = 'numeric'
     config.columns[:yahoo_value].css_class = 'numeric'
     config.columns[:difference].css_class = 'numeric'
        
     columns[:symbol].label = "Stock Symbol"
     columns[:symbol].inplace_edit = false
     
     columns[:stockname].label = "Stock Name"
     
     columns[:price].label = "Purchased Price"
     columns[:price].inplace_edit = false
     
     columns[:quantity].label = "Qty. Purchased"
     columns[:quantity].inplace_edit = false
     
     columns[:purchased_value].label = "Purchased Value"
     
     columns[:yahoo_ask_price].label = "Current Ask Price"
     columns[:yahoo_value].label = "Current Ask Value"
     
     columns[:difference].label = "+/-"
       
     list.columns.exclude :created_at, :updated_at

  end
end
