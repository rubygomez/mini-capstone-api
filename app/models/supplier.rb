class Supplier < ApplicationRecord
    has_many :products
end

#shortcut^ for ->>>   # def products
#                       Product.where(supplier_id: id)
#                   end