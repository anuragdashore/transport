class Item < ApplicationRecord
  belongs_to :booking

  validates :item_name, presence: true
  validates :item_size, presence: true
  validates :item_weight, presence: true
end
  