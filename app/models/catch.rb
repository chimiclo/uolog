class Catch < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  validates :caught_on, presence: true
  validates :fish_name, presence: true
end
