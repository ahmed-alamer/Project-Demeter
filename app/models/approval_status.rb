class ApprovalStatus < ActiveRecord::Base
	self.primary_key = :code #this overrides the primary key

	has_many :projects, foreign_key: :status
end
