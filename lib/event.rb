class Event < ActiveRecord::Base 
  belongs_to :attraction
  belongs_to :venue
end
