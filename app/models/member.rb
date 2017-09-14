class Member < ApplicationRecord
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :phone_number, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates_uniqueness_of :first_name, scope: :last_name
end
