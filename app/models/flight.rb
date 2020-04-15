class Flight < ApplicationRecord
  belongs_to :aircraft
  belongs_to :route
end
