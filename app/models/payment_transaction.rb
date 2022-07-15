class PaymentTransaction < ApplicationRecord
  belongs_to :bank_account

  TRANSACTION_TYPES = ["withdraw","deposit"]
  STATUSES = ["failed", "completed"]

  validates :bank_account, presence: true
  validates :amount, presence: true, numericality: { :greater_than => 0 }
  validates :transaction_id, presence: true, uniqueness: { scope: :transaction_type }
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES}

  scope :failed, -> { where(status: PaymentTransaction.statuses.failed) }
  scope :completed, -> { where(status: PaymentTransaction.statuses.completed) }
  scope :withdrew, -> { where(transaction_type: PaymentTransaction.transaction_types.withdraw) }
  scope :deposited, -> { where(transaction_type: PaymentTransaction.transaction_types.deposit) }

  def self.statuses
    OpenStruct.new(failed: "failed", completed: "completed")
  end

  def self.transaction_types
    OpenStruct.new(withdraw: "withdraw", deposit: "deposit")
  end

end