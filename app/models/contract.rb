class Contract < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :company_user
end
