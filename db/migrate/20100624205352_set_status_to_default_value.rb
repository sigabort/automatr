class SetStatusToDefaultValue < ActiveRecord::Migration
  def self.up
    change_column :institutes, :status, :string, :default => "Active", :null => false
  end

  def self.down
    #Dont do anything. let status have default value when not set
  end
end
