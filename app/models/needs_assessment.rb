class NeedsAssessment < ApplicationRecord
  belongs_to :user
  belongs_to :requester, class_name: "Member"
  belongs_to :receiver, class_name: "Member"

  accepts_nested_attributes_for :requester
  validates_associated :requester
  accepts_nested_attributes_for :receiver
  validates_associated :receiver
end
