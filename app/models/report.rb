class Report < ApplicationRecord
  belongs_to :location
  belongs_to :user
end
