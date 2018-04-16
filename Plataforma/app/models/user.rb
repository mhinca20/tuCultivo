class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
         has_many :collaborations, inverse_of: :user
  has_many :nodes, through: :collaborations
  accepts_nested_attributes_for :collaborations
end
