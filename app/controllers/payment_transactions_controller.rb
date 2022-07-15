class PaymentTransactionsController < ApplicationController
  before_action :get_bank_account

  def index
    @transactions = @bank_account.payment_transactions.order('created_at desc')
  end

  def initiate_transaction
  end

  def search_bank_account
    @bank_account = BankAccount.where.not(id: @bank_account.id).get_account(params[:search].downcase).last
  end

  def new
    @payment_transaction = PaymentTransaction.new
    @receiver_bank_account = BankAccount.find_by_id(params["bank_account_id"])
  end

  def create
    response = ProcessTransactionService.new(@bank_account, params).process
    if response[:errors].present?
      flash[:error] = response[:errors].join(", ")
    else
      flash[:success] = "Amount Transferred Successfully"
    end
    redirect_to initiate_transaction_payment_transactions_path
  end

  private

  def get_bank_account
    @bank_account = current_user.bank_account
  end

end
