class Position < ApplicationRecord
    #belongs_to :company

    has_many :company, through: :company_position


end
