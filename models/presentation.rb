class Presentation < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :deck_url, presence: true
  validates_presence_of :user_id
  has_many :presentation_owners

  after_create :create_ownership

  def create_ownership
    PresentationOwner.create({presentation_id: self.id,user_id: self.user_id})
  end
end