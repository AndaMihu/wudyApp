class University < ApplicationRecord
    has_many :programmes
    has_many :teachers
end
