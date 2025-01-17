class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def available?
    return (self.inventory > 0)
  end

end
