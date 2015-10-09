class Grant < ActiveRecord::Base
	belongs_to :project
	belongs_to :wallet, foreign_key: :receiver_wallet
	has_many :bounties
end
