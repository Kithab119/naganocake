class Item < ApplicationRecord

  has_one_attached :item_image

  belongs_to :genre

  has_many :cart_items, dependent: :destroy

  has_many :order_details, dependent: :destroy

  def self.looks(word)
    return Item.all unless word
    #return => 値を返す, unless => 〜なければ
    Item.where('name LIKE ?', "%#{word}%")
    #LIKE ? => 参照する, %#{部分一致}%
  end

end
