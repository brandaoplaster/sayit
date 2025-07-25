class Quote < ApplicationRecord
  validates :name, presence: true
  belongs_to :user

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
end
