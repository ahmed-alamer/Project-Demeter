class Project < ActiveRecord::Base
	belongs_to :claimant
	has_many :grants
end
