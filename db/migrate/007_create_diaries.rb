class CreateDiaries < ActiveRecord::Migration
  def self.up
    create_table :diaries do |t|
      t.column :date_saved, :datetime
      t.column :user_id, :integer
      t.column :subject, :string
      t.column :body, :text
    end
  end

  def self.down
    drop_table :diaries
  end
end
