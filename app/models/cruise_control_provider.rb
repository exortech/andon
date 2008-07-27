class CruiseControlProvider < ActiveRecord::Base
	has_one :metric, :as => :provider
	belongs_to :cruise_control_server

	alias_method :server, :cruise_control_server
	alias_method :server=, :cruise_control_server=
end
