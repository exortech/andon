class Dashboard < ActiveRecord::Base
	has_many :metrics, :foreign_key => 'dashboard_id'
	validates_presence_of :name
	validates_uniqueness_of :name

	def self.find_by_name(name)
		self.find(:first, :conditions => ["name = :name", {:name => name}])
	end
end
