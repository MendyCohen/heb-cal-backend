class User < ApplicationRecord

  has_secure_password
  before_save :downcase_email

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

  has_many :events
  has_many :global_events
end
