class Wallet < ApplicationRecord
  belongs_to :user
  # has_many :transactions
  # has_many :credited_transactions, class: "Transaction", foreign_key: "target_wallet_id"
  # has_many :debited_transactions, class: "Transaction", foreign_key: "source_wallet_id"

  def calculated_balance
    Transaction.credited(self.id).select(:amount).sum - Transaction.debited(self.id).select(:amount).sum
  end
end
