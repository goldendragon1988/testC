class User < ApplicationRecord
  include Oauthable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: %i[google_oauth2]

  validates :first_name, :last_name, presence: true

  has_many :providers, dependent: :destroy
end
