# frozen_string_literal: true

class User < ApplicationRecord
  has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  attr_accessor :login

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      [
        'lower(username) = :value OR lower(email) = :value',
        { value: login.strip.downcase }
      ]
    ).first
  end
end
