class AddProviderTypeColumnToMetricTable < ActiveRecord::Migration
  def self.up
	add_column :metrics, :provider_type, :string, :null => false
	add_column :metrics, :provider_id, :integer, :null => false
  end

  def self.down
  end
end
