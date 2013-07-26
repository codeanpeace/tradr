class Stock < ActiveRecord::Base
  belongs_to :user
  attr_accessible :quantity, :starting_price, :symbol

  before_create :set_starting_price

  def set_starting_price
    # quote = StockQuote::Stock.quote(symbol)
    # self.starting_price = quote.last

    quote = Ystock.get_stock(symbol).first[1]
    self.starting_price = quote[:price]
  end

  def latest_price
    # quote = StockQuote::Stock.quote(symbol)
    # quote.last

    quote = Ystock.get_stock(symbol).first[1]
    quote[:price]
  end

  def profit
    paid_initially         = (self.starting_price * self.quantity).to_f
    latest_value_of_shares = (latest_price   * quantity).to_f

    paid_initially - latest_value_of_shares
  end
end
