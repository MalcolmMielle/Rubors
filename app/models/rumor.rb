class Rumor < ActiveRecord::Base
	validates :status, 
		presence: true
	belongs_to :user
end
