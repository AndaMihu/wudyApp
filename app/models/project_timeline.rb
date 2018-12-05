class ProjectTimeline < ApplicationRecord
  belongs_to :company

  has_many :task 
  accepts_nested_attributes_for :task

end
