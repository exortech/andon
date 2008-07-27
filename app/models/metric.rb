class Metric < ActiveRecord::Base
	belongs_to :dashboard
	belongs_to :provider, :polymorphic => true
	has_one :measure, :order => "timestamp DESC"

	def value
		measure == nil ? nil : measure.value
	end

	def status
		measure == nil ? nil : "problem"
	end
end
