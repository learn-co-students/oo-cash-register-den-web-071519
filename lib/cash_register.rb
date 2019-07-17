require "pry"

class CashRegister
    attr_accessor :total, :discount, :item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_item_price = 0
    end

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @last_item_price = price
        if quantity > 1
            quantity.times do
                @items << item
            end
        else
            @items << item
        end
    end

    def apply_discount
        if discount > 0
            @total = total - total * discount/100.to_f
            "After the discount, the total comes to $800."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end
    
    def void_last_transaction
       @total = @total - @last_item_price
    end
end