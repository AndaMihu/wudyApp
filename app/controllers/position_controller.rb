class PositionController < ApplicationController

def index
    @positions = Position.where(id: company_id.id)    
end 

end
