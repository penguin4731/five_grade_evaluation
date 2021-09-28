class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.integer :excellent
      t.integer :verygood
      t.integer :good
      t.integer :average
      t.integer :poor
      t.timestamps null: false
    end
  end
end
