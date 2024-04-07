class Order < ApplicationRecord
    belongs_to :user
    has_many :carted_products
    has_many :products, through: :carted_products

    def tax
        tax = 1.08
    end
    def total
        total = quantity.to_d * subtotal * tax
    end
end
