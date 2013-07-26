class StocksController < ApplicationController
  # POST /stocks
  # POST /stocks.json
  def create
    @stock = current_user.stocks.build(params[:stock])
    @stock.save
    @stocks = current_user.stocks
    @unique_stock_symbol_list = current_user.unique_stock_symbol_list
  end

  def graph
    symbol = params[:symbol]
    render :json => {:time => Time.now, :latest_price => Stock.find_by_symbol(symbol).latest_price}

  end
end
