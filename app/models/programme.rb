class Programme < ApplicationRecord
  belongs_to :university
  has_many :student
end
