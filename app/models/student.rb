class Student < ApplicationRecord
  has_one :programme
  has_one :contract
  accepts_nested_attributes_for :contract

  belongs_to :teacher


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
