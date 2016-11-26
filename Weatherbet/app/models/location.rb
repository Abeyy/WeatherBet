class Location < ApplicationRecord
	has_many :predictions
	has_many :reports
end
