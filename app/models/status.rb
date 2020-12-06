class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '空' },
    { id: 2, name: '満' }
  ]

  include ActiveHash::Associations
  has_many :machines
end
