class Claimant < ActiveRecord::Base
	has_many :projects
	has_many :wallets
end
