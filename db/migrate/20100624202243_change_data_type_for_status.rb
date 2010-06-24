class ChangeDataTypeForStatus < ActiveRecord::Migration
  def self.up
    change_table :institutes do |t|
      t.change :status, :string
    end
  end

  def self.down
    # Keep the status as string
  end
end
