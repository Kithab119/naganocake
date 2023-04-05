class OrderDetail < ApplicationRecord

  belongs_to :order

  belongs_to :item

  enum is_create: { cannot_manufacture: 0, waiting_manufacture: 1, manufacture: 2, complete_manufacture: 3 }

end
