class Api::WalletsController < ApplicationController
  def show
      # user = User.find_by_id(id)
      user = User.find(id)
      user_type = user.type
      user_id = user.id
      balance = calculate_balance(user_type, user_id)
     
      if balance.nil?
        render json: { error: "User not found" }, status: :not_found
      else
        render json: { user_type: user.type, user_id: user.id, balance: balance }
      end
    end

    private

    def calculate_balance(user_type, user_id)
      case user_type
      when "Team"
        Team.find_by(id: user_id)&.transactions&.sum(:amount)
      when "Stock"
        Stock.find_by(id: user_id)&.transactions&.sum(:amount)
      else
        nil
      end
    end
end
