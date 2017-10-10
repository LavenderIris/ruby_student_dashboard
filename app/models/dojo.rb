class Dojo < ActiveRecord::Base
	validates :branch, :street, :city, presence: true
	validates :state, presence: true, length: {is: 2}
	has_many :students
end
