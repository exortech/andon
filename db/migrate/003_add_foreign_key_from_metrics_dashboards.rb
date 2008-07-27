class AddForeignKeyFromMetricsDashboards < ActiveRecord::Migration
  def self.up
	  add_column :metrics, :dashboard_id, :integer, :null => false
  end

  def self.down
	  remove_column :metrics, :dashboard_id
  end
end
