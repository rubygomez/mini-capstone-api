class Product < ApplicationRecord
    belongs_to :user
    has_many :orders
    validates :quantity, comparison: {greater_than: 0}

    # def supplier
    #     Supplier.find_by(id: supplier_id)
    # end
    belongs_to :supplier
    validates :supplier, presence: true
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











