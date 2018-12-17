class Event < ApplicationRecord
    validates :title, presence: true
    attr_accessor :date_range

    has_one :student

    accepts_nested_attributes_for :student

    def all_day_event?
      self.start == self.start.midnight && self.end == self.end.midnight ? true : false
    end  
end
