class Programme < ApplicationRecord
  belongs_to :university
  has_many :students
  accepts_nested_attributes_for :students
end
