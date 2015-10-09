class Project < ActiveRecord::Base
	belongs_to :claimant
	has_many :grants
	belongs_to :approval_status, foreign_key: :status
end
