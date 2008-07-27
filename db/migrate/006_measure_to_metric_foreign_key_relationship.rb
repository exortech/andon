class MeasureToMetricForeignKeyRelationship < ActiveRecord::Migration
  def self.up
	  add_column :measures, :metric_id, :integer, :null => false
	  add_index :measures, [:metric_id, :timestamp]

	  dashboard = Dashboard.find_by_name("CruiseControlStatus")
	  dashboard.metrics[0].measure = Measure.new :value => "15", :timestamp => Time.now
	  dashboard.save!
  end

  def self.down
	  remove_index :measures, [:metric_id, :timestamp] 
	  remove_column :measures, :metric_id
  end
end
