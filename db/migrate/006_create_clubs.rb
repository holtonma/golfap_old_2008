class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.column :date_saved, :datetime
      t.column :type_id, :integer
      t.column :make, :string
      t.column :model, :string
      t.column :loft_degs, :decimal
      t.column :lie_degs, :decimal
      t.column :length_inches, :decimal
      t.column :grip, :string
    end
  end

  def self.down
    drop_table :clubs
  end
end
