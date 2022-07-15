class CreatePaymentTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_transactions do |t|
      t.decimal :amount
      t.string :transaction_type
      t.string :status
      t.string :remarks
      t.string :transaction_id
      t.references :bank_account, index: true

      t.timestamps
    end
  end
end
