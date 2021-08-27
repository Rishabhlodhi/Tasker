class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one :profile, dependent: :delete
  has_many :tasks
  has_one_attached :image
  accepts_nested_attributes_for :profile
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  #validates :email, presence: true,uniqueness: { case_sensitive: false }
  #validates :phone, presence: true, numericality:{ message: ' 10 digits number' }
  #validates :name, presence: true
  #validates :role, presence: true
  end
