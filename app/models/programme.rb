class Programme < ApplicationRecord
  belongs_to :university
  has_many :students
end
