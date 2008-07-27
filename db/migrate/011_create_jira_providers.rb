class CreateJiraProviders < ActiveRecord::Migration
  def self.up
    create_table :jira_providers do |t|
    end
  end

  def self.down
    drop_table :jira_providers
  end
end
