class Company < ApplicationRecord
  
  belongs_to :industry

  has_one :contract

  has_many :student

  has_many :position, through: :company_position

end
