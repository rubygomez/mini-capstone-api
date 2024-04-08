class Product < ApplicationRecord
    validates :quantity, comparison: {greater_than: 0}
    validates :supplier, presence: true
    
    # def supplier
    #     Supplier.find_by(id: supplier_id)
    # end
    belongs_to :supplier
    has_many :carted_products
    has_many :orders, through: :carted_products
    has_many :images  
    has_many :category_products
    has_many :categories, through: :category_products
    
    # def categories
    #     category_product.map do |category_product|
    #         category_product.category
    #     end
    # end
    # def images
    #     Image.where(product_id: id)
    # end

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











