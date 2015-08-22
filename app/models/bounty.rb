class Bounty < ActiveRecord::Base
	belongs_to :grant
	belongs_to :wallet, foreign_key: :receiver_wallet 
end
