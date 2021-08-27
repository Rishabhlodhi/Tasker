class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  #validates :birth_date ,presence:true
  #validates :address ,presence:true
  #validates :image ,presence:true
end
