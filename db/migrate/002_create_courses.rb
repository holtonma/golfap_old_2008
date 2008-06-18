class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.column :name, :string
      t.column :address1, :string
      t.column :address2, :string
      t.column :phone, :string
      t.column :city, :string
      t.column :state, :string
      t.column :rating, :decimal
      t.column :slope, :integer
      t.column :num_holes, :integer
      t.column :total_par, :integer
      t.column :date_added, :datetime
    end
  end

  def self.down
    drop_table :courses
  end
end
