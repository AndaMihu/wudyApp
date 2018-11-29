class InternshipCoachesController < ApplicationController
    def index
        @teacher = Teacher.where(id: current_student.teacher_id).first
        @uni = University.where(id: 1).first
    end
end
