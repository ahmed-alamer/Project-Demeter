class Project < ActiveRecord::Base
	belongs_to :claimant
	has_many :grants
	has_one :wallet
	belongs_to :approval_status, foreign_key: :status
end
