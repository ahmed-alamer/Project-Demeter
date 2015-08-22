class Wallet < ActiveRecord::Base
	belongs_to :claimant
	has_many :grants, foreign_key: :receiver_wallet
	has_many :bounties, foreign_key: :receiver_wallet
end
