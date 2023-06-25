class Product < ApplicationRecord
  belongs_to :genre
  has_one_attached :product_image

  def get_product_image(width, height)
    unless product_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    product_image.variant(resize_to_limit: [100, 100]).processed
  end
end
