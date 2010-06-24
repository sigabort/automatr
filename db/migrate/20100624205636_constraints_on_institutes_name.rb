class ConstraintsOnInstitutesName < ActiveRecord::Migration
  def self.up
    change_column :institutes, :name, :string, :null => false
  end

  def self.down
    #Keep name as non-null field
  end
end
