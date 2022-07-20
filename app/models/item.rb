class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_summary
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :item_status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_date_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date
end
