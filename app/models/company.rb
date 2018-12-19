class Company < ApplicationRecord
  
  belongs_to :industry

  has_one :contract

  belongs_to :company_user

  accepts_nested_attributes_for :company_user

  #has_many :student

  has_many :company_position
  has_many :position, through: :company_position

end
