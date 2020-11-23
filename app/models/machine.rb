class Machine < ApplicationRecord
  belongs_to :user
  # has_one :reservation
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :detail
    validates :image
  end
end
