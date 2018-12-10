class Company < ApplicationRecord
  
  has_many :students
  accepts_nested_attributes_for :students


  belongs_to :industry

  belongs_to :contract

  has_many :position

  accepts_nested_attributes_for :position


end
