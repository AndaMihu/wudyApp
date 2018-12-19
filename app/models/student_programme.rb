class StudentProgramme < ApplicationRecord
    belongs_to :programme
    belongs_to :student
end
