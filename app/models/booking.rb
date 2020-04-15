class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :customer
end
