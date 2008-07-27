class CreateDashboards < ActiveRecord::Migration
  def self.up
    create_table :dashboards do |t|
	    t.column :name, :string
    end
  end

  def self.down
    drop_table :dashboards
  end
end
