class AddAdditionalMetricToTestMeasureForeignKey < ActiveRecord::Migration
  def self.up
	  dashboard = Dashboard.find_by_name("CruiseControlStatus")
	  dashboard.metrics[0].create_measure :value => "20", :timestamp => Time.now 
  end

  def self.down
	  Dashboard.find_by_name("CruiseControlStatus").metrics[0].measure.destroy
  end
end
