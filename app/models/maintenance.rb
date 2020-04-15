class Maintenance < ApplicationRecord
  belongs_to :employee
  belongs_to :aircraft
end
