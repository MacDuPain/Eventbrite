class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.text :title
      t.text :description
      t.integer :price
      t.text :location

      t.timestamps
    end
  end
end
