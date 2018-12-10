class Industry < ApplicationRecord
    has_many :company

    accepts_nested_attributes_for :company
end
