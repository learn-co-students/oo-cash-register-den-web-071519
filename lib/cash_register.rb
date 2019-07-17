require 'pry'

class CashRegister
  attr_accessor :discount, :total, :items, :cart

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @cart = []
  end

  def add_item(title, price, quantity=1)
    self.total += price*quantity
    quantity.times do
      @items << title
      @cart << {title: price}
    end

  end

  def apply_discount
    if @discount > 0
      self.total = self.total - (self.total * self.discount.to_f/100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @cart.last.values[0]
  end

end
