class ApprovalStatus < ActiveRecord::Base
	has_many :projects
end
