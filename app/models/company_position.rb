class CompanyPosition < ApplicationRecord
  belongs_to :company
  belongs_to :position
end
