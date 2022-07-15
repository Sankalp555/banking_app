module PaymentTransactionsHelper

  def get_accounts_info(transaction)
    received_transaction = PaymentTransaction.where.not(id: transaction.id).where(transaction_id: transaction.transaction_id).last
    return "Sent to " + received_transaction.bank_account.account_number  if transaction.transaction_type == PaymentTransaction.transaction_types.withdraw && received_transaction.present?
    return "Received from " + received_transaction.bank_account.account_number  if transaction.transaction_type == PaymentTransaction.transaction_types.deposit && received_transaction.present?
  end

  def transaction_type_class(transaction)
    return transaction.transaction_type == PaymentTransaction.transaction_types.deposit ? "text-success" : "text-danger"    
  end
end