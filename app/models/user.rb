class User < ApplicationRecord
  has_many :transactions
  has_one :wallet

  after_save :wallet_creation

  private
  def wallet_creation
    #creating wallet with 50 INR as a basic amount, ideally this amount should be updated by admin
    self.create_wallet(balance: 50, currency: 'INR')
  end
end
