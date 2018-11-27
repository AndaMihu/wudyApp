class Contract < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  has_one :company_user
  has_one :internship_agreement
  has_one :contact_company_user

  accepts_nested_attributes_for :company_user
  accepts_nested_attributes_for :internship_agreement
  accepts_nested_attributes_for :contact_company_user



end
