class ContractTeacherAccept < ApplicationRecord
    has_many :contracts
    has_many :teachers
end
