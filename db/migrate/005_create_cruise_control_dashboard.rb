class CreateCruiseControlDashboard < ActiveRecord::Migration
  def self.up
	  dashboard = Dashboard.new(:name => "CruiseControlStatus")
	  dashboard.metrics = [Metric.new(:name => "Build"), Metric.new(:name => "Install")]
	  dashboard.save!
  end

  def self.down
	  Dashboard.find_by_name("CruiseControlStatus").destroy
  end
end
