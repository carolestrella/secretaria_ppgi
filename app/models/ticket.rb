class Ticket < ApplicationRecord
  belongs_to :user
  validate :date_out_greater_than_in, on: [:create, :update]

  def date_out_greater_than_in
    if data_saida < data_entrada
      errors.add(:data_entrada, "cannot be greater than return date")
    end
  end
end
