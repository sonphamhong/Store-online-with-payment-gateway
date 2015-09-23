class Product < ActiveRecord::Base
  has_many :cart_items
  mount_uploader :image, ImageUploader

  validates_presence_of :name, :price
  validates_numericality_of :price
  belongs_to :category
end
