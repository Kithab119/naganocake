class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }

  enum is_receive: { waiting_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: 4 }

end
