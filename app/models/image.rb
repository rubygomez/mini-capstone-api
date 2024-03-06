class Image < ApplicationRecord
    def images
        Image.where(image_id: id)
    end
end
