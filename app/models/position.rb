class Position < ApplicationRecord
    belongs_to :company
    #has_many :company_position
    #accepts_nested_attributes_for :company_position
    #has_many :company, through: :company_position


end
