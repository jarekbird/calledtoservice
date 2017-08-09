class Server < ApplicationRecord
  belongs_to :member

  accepts_nested_attributes_for :member
  validates_associated :member

  validates_uniqueness_of :member_id
end
