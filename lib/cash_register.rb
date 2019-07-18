
class CashRegister

    attr_accessor :cash_register, :discount, :total, :last_item, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        self.total += price * quantity
        quantity.times {items << item}
        self.last_item = price * quantity
    end

    def apply_discount
        if @discount != 0
            self.total = total * (1-discount/100.0)
            "After the discount, the total comes to $#{total.to_i}."
        else
            "There is no discount to apply."
        end
    
    end

   

    def void_last_transaction
        self.total -= last_item
    end

end
