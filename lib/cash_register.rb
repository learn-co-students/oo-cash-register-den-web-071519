class CashRegister
    attr_accessor :total, :discount

    @@last_transaction = nil

    def initialize(num = 0)
        @total = 0
        @discount = num
        @items = []
    end

    def items
        @items
    end

    def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
            quantity.times do 
                @items << item
            end
        @@last_transaction = (price * quantity)
    end

    def apply_discount
        if @discount != 0 then
            self.total = @total * 0.8
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @@last_transaction
    end
end
