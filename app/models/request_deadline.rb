class RequestDeadline < ApplicationRecord
  validate :deadline_greater_current_date, on: [:create, :update]

  def deadline_greater_current_date
    now = DateTime.now()
    
    if deadline < now      
      errors.add(:deadline, "cannot be less than current date")
    end
  end
end
