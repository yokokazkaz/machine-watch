class Machine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :reservation
  has_one_attached :image
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :detail
    validates :image
  end
end
