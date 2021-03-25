class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.date :delivery_date
      t.string :status

      t.timestamps
    end
  end
end
