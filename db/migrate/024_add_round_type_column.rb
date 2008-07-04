class AddRoundTypeColumn < ActiveRecord::Migration
  def self.up
    add_column :rounds, :tourney_type_id, :integer
  end

  def self.down
    remove_column :rounds, :tourney_type_id
  end
end
