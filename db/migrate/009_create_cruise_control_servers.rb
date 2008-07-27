class CreateCruiseControlServers < ActiveRecord::Migration
  def self.up
    create_table :cruise_control_servers do |t|
	    t.column :url, :string
	    t.column :pollingInterval, :integer
    end
  end

  def self.down
    drop_table :cruise_control_servers
  end
end
