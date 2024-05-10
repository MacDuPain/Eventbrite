class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.text :stripe_customer_id

      t.timestamps
    end
  end
end
