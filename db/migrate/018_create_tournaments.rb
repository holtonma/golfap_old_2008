class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
