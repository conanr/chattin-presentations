class PresentationOwner < ActiveRecord::Base
  validates :user_id, :presentation_id, presence: true
  belongs_to :presentation
end