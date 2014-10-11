class User < ActiveRecord::Base
	validates :name, 
		presence: true, 
		uniqueness: true
	validates :age, 
		presence: true, 
		numericality: true
	has_many :rumors
end
