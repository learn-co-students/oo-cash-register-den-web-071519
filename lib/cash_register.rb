require 'pry'


class CashRegister
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @itemsArray = []
        @pricesArray = []
    end

    def discount
        @discount
    end

    def total= newTotal
        @total = newTotal
    end

    def total
        @total
    end

    def add_item (title, price, quantity=1)
        @total += price*quantity
        quantity.times {@itemsArray << title}
        quantity.times {@pricesArray << price}
    end

    def apply_discount
        if @discount > 0
            @total -= @total*(@discount/100.0)
        else
            return "There is no discount to apply."
        end

        return "After the discount, the total comes to $#{@total.to_i}."
    end

    def items
        return @itemsArray
    end

    def void_last_transaction
        @total -= @pricesArray.last
    end
end

