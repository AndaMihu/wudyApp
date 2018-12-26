class ContractCompanyUserAccept < ApplicationRecord
    has_many :contracts
    has_many :teachers
    has_many :companies

end
