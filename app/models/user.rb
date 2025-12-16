class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable

  has_many :catches, dependent: :destroy
  has_one :profile, dependent: :destroy
  after_create :create_default_profile

  private

  def create_default_profile
    build_profile unless profile
    profile.save!(validate: false)
  end
end
