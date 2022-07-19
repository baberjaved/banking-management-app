class Transaction < ApplicationRecord
  belongs_to :account_from, class_name: 'Account', foreign_key: :account_from_id, optional: true
  belongs_to :account_to, class_name: 'Account', foreign_key: :account_to_id, optional: true

  validates :amount, presence: true
end
