class Presentation < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :deck_url, presence: true
  validates_presence_of :user_id
  has_many :presentation_owners
end