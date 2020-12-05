class Request < ApplicationRecord
  belongs_to :request_type
  belongs_to :user
end