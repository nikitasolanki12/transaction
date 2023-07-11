class Api::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  def index
    @transactions = Transaction.all
    render json: @transaction
  end

  def show
  end

  def new
    @transaction = Transaction.new
    render json: @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save

    render json: @transaction
  end

  def update
    @transaction.update(transaction_params)
    render json: @transaction
  end

  def destroy
    @transaction.destroy
    render json: @transaction
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :source_wallet_id, :target_wallet_id)
    end
end
