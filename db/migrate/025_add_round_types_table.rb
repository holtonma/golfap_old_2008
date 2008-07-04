class AddRoundTypesTable < ActiveRecord::Migration
  def self.up
    create_table :round_types do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :round_types
  end
end
