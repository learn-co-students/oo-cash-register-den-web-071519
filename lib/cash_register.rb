require "pry"
class CashRegister
    attr_reader :discount
    attr_accessor :total, :cart, :transaction

    def initialize discount = 0
        @total = 0
        @discount = discount
        @cart = []
        @transaction = {}

    end
    def add_item (title, price, *quantity)
        if quantity != []
            @total += price*quantity[0]
            quantity[0].times do 
                @cart << title
            end
        else
            @total += price
            @cart << title
        end
        @transaction[title] = price
    end
    def apply_discount
        if @discount > 0
            @total = @total - (@total * @discount/100)
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end
    def items
        self.cart
    end
    def void_last_transaction
        @total = total - @transaction.values[-1]
    end
end

