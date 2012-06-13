class Presentation < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates_presence_of :user_id, :deck_url
  validates_format_of :deck_url, with: /^(https):\/\/[speakerdeck]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  has_many :presentation_owners

  after_create :create_ownership

  def create_ownership
    pwner = PresentationOwner.create!({ presentation_id: self.id, user_id: self.user_id })
  end
end
