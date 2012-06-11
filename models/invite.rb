class Invite < ActiveRecord::Base
  validates :presentation_id, :email, :name, presence: true
  validates_uniqueness_of :email, scope: :presentation_id
  belongs_to :presentation
end