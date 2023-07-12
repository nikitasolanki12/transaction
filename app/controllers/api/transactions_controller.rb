class Api::TransactionsController < ApplicationController
  before_action :authorize_request, only: :create
  
  def create
    # current_account is the source of transaction
    @transaction = Transaction.new(transaction_params.merge!(:source_wallet_id: @current_account.wallet.id))
    @transaction.save

    render json: @transaction
  end

  private
  
  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:amount, :target_wallet_id)
  end
end
