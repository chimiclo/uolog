class Catch < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :fish_name, presence: true
  validates :caught_on, presence: true
end
