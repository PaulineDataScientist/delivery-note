class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :orderno
      t.datetime :orderdate
      t.string :suppliername
      t.string :projectid

      t.timestamps null: false
    end
  end
end
