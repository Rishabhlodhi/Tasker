class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title , presence: true
  validates :description, presence: true
  validates :company_name, presence: true
  validates :location, presence: true
end
