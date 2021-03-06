class Item < ActiveRecord::Base
  has_many :item_packs, dependent: :destroy
  has_many :order_items
  validates :name, presence: true, allow_blank: false
  accepts_nested_attributes_for :item_packs
end