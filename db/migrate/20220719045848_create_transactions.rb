class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :account_from_id
      t.integer :account_to_id

      t.timestamps null: false
    end
  end
end
