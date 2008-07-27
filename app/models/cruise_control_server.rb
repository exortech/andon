class CruiseControlServer < ActiveRecord::Base
	has_one :cruise_control_provider

	def initialize(params = nil)
		super
		self.pollingInterval = 60 unless self.pollingInterval
	end
end
