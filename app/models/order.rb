class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product

    def tax
        tax = 1.08
    end
    def total
        total = quantity.to_d * subtotal * tax
    end
end
