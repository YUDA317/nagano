class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_item

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
