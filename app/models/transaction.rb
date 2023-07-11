class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: "User"
  belongs_to :target_wallet, class_name: "User"
end
