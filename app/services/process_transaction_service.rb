class ProcessTransactionService
  attr_reader :sender_bank_account, :receiver_bank_account, :transaction_id, :amount, :remarks, :errors

  def initialize(bank_account, params)
    @sender_bank_account = bank_account
    @receiver_bank_account = BankAccount.find_by_id(params["payment_transaction"]["bank_account_id"])
    @transaction_id = SecureRandom.uuid
    @amount = params["payment_transaction"]["amount"].to_f.round(2)
    @remarks = params["payment_transaction"]["remarks"]
    @errors = []
  end

  def process
    if validate_account_balance?
      start_transaction_process
    end
    return {errors: errors}
  end

  private

  def validate_account_balance?
    if sender_bank_account.balance - amount < 0.00
      sender_bank_account.payment_transactions.create(amount: amount, transaction_type: PaymentTransaction.transaction_types.withdraw, status: PaymentTransaction.statuses.failed, remarks: remarks, transaction_id: transaction_id)
      errors << "You don't have enough balance to complete this transaction."
      return false
    else
      return true
    end
  end

  def start_transaction_process
    begin
      ActiveRecord::Base.transaction do
        sender_bank_account.update(balance: (sender_bank_account.balance - amount) )
        sender_bank_account.payment_transactions.create(amount: amount, transaction_type: PaymentTransaction.transaction_types.withdraw, status: PaymentTransaction.statuses.completed, remarks: remarks, transaction_id: transaction_id)

        receiver_bank_account.update(balance: (receiver_bank_account.balance + amount) )
        receiver_bank_account.payment_transactions.create(amount: amount, transaction_type: PaymentTransaction.transaction_types.deposit, status: PaymentTransaction.statuses.completed, remarks: remarks, transaction_id: transaction_id)
      end
    rescue
     errors << "Something Went Wrong"
    end
  end

end