class Company < ApplicationRecord
  belongs_to :industry
  
  has_one :contract
  
  has_many :students, through: :contract

  belongs_to :company_user
  
  #has_many :positions
  
  has_many :company_position
  has_many :position, through: :company_position
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
