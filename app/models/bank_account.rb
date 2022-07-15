class BankAccount < ApplicationRecord
  belongs_to :user 
  has_many :payment_transactions

  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: { :greater_than => 0 }

  scope :get_account, -> (account_number) { where('account_number LIKE ?', account_number) }

  delegate :full_name, :email, to: :user, prefix: true, allow_nil: true

end