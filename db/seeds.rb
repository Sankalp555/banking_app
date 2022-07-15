BankAccount.destroy_all
PaymentTransaction.destroy_all
User.destroy_all

User.create(first_name: 'SBI', last_name: 'User', email: 'sbi@gmail.com', password: "test123", password_confirmation: "test123")
User.create(first_name: 'PNB', last_name: 'User', email: 'pnb@gmail.com', password: "test123", password_confirmation: "test123")
User.create(first_name: 'Axis', last_name: 'User', email: 'axis@gmail.com', password: "test123", password_confirmation: "test123")


user = User.first
user.create_bank_account(balance: 1000.00, account_number: "test00001")
user.bank_account.payment_transactions.create(amount: 1000.00, transaction_type: "deposit", status: "completed", remarks: "Initial Transaction", transaction_id: SecureRandom.uuid)

user = User.second
user.create_bank_account(balance: 1000.00, account_number: "test00002")
user.bank_account.payment_transactions.create(amount: 1000.00, transaction_type: "deposit", status: "completed", remarks: "Initial Transaction", transaction_id: SecureRandom.uuid)

user = User.third
user.create_bank_account(balance: 1000.00, account_number: "test00003")
user.bank_account.payment_transactions.create(amount: 1000.00, transaction_type: "deposit", status: "completed", remarks: "Initial Transaction", transaction_id: SecureRandom.uuid)