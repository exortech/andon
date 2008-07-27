class CreateCruiseControlProviders < ActiveRecord::Migration
  def self.up
    create_table :cruise_control_providers do |t|
	    t.column :cruise_control_server_id, :integer
	    t.column :project, :string
    end
  end

  def self.down
    drop_table :cruise_control_providers
  end
end
