# Класс, представляющий собой элементы чеклиста.
class Item < ApplicationRecord
  validates :task, presence: true, length: { maximum: 100 }
end
