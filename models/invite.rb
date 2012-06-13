class Invite < ActiveRecord::Base
  validates :presentation_id, :email, :name, presence: true
  validates_uniqueness_of :email, scope: :presentation_id
  belongs_to :presentation

  def p
    "#{self.presentation.id} #{self.presentation.title}".parameterize
  end
  
  def u
    if self.presentation.user_name
      "#{self.presentation.user_id} #{self.presentation.user_name}".parameterize
    else
      self.presentation.user_id
    end
  end
end