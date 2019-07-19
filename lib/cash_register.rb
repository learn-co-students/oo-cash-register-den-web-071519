require "pry"
class CashRegister
    attr_accessor :total, :discount, :cart, :last_item_price

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(title, price, quantity=1)
        quantity.times { @cart << title }
        @total += price * quantity
        @last_item_price = price
    end

    def apply_discount
        if @discount != 0
            @total -= @total * @discount / 100
            p "After the discount, the total comes to $#{@total}."
        else 
            p "There is no discount to apply."
        end
    end

    def items 
        @cart
    end

    def void_last_transaction
        @total -= @last_item_price
    end
    
end
