# frozen_string_literal: true

# User
class User < ApplicationRecord
  # include Lockable
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :lockable

  validates :login, presence: true, uniqueness: { case_sensitive: false }

  def full_name
    "#{last_name} #{first_name}"
  end

  # searchable do
  #   text :first_name, :last_name, :email
  # end
end
