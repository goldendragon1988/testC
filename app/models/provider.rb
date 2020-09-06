class Provider < ApplicationRecord
  belongs_to :user
  validates :name, :uid, presence: true
  validates :uid, uniqueness: true
end
