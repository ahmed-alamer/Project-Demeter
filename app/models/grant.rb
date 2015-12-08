class Grant < ActiveRecord::Base
	belongs_to :project
	has_many :bounties
end
