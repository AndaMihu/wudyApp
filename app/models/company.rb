class Company < ApplicationRecord
  
  belongs_to :industry

  belongs_to :contract

end
