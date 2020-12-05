# frozen_string_literal: true

class User < ApplicationRecord
  validates :full_name, presence: true
  validates :role, presence: true
  
  has_many :tickets
  has_many :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[administrator secretary professor student]
end