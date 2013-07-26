class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :cash

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  has_many :stocks

  def unique_stock_symbol_list
    self.stocks.select("distinct stocks.symbol").map {|s| s.symbol}.sort
  end
end