class ApprovalStatus < ActiveRecord::Base
	has_many :projects, foreign_key: :status
end
