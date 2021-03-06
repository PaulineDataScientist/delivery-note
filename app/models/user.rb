class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :user_projects
  has_many :projects, through: :user_projects
#   has_many :orders, through: :user_projects
#   has_many :order_items, through: :orders

  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added?(ticker_symbol)
  end
  
  def under_stock_limit?
    (user_stocks.count < 10)
  end
  
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock_id).exists?
  end
end
