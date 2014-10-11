class User < ActiveRecord::Base
	validates :name, 
		presence: true, 
		uniqueness: true
	validates :birthdate, 
		presence: true, 
		numericality: true
	has_many :rumors
end
