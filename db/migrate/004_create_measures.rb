class CreateMeasures < ActiveRecord::Migration
  def self.up
    create_table :measures do |t|
	  t.column :value, :string
	  t.column :timestamp, :datetime
    end
  end

  def self.down
    drop_table :measures
  end
end
