class Contract < ApplicationRecord
  
  belongs_to :teacher
  belongs_to :student
  belongs_to :company
  belongs_to :internship_type

  has_one :internship_agreement
  has_one :contact_company_user

  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :internship_agreement
  accepts_nested_attributes_for :contact_company_user

  has_many :contract_teacher_accepts
  accepts_nested_attributes_for :contract_teacher_accepts

  has_many :contract_company_user_accepts
  accepts_nested_attributes_for :contract_company_user_accepts

end
