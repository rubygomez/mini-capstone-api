class Product < ApplicationRecord
    # validates :name, presence: true
    # validates :price, presence: true
    # validates :price, numericality: true
    # validates :description,length: {minimum: 20}
    validates :quantity, comparison: {greater_than: 0}

    # def supplier
    #     Supplier.find_by(id: supplier_id)
    # end
    belongs_to :supplier
    # shortcut^ for ^^
    
    def images
        Image.where(product_id: id)
    end

    def is_discounted?
        price <= 10
    end

    def tax
        tax = price * 0.09
    end

    def total
        tax + price
    end

end











