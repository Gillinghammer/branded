class Lookup < ActiveRecord::Base
  has_many :searches, foreign_key: "lookup_id", dependent: :destroy
  after_initialize :poll_clearbit
  extend FriendlyId
  friendly_id :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def poll_clearbit
    unless self.clearbit_result
      person = Clearbit::Streaming::Person.find(email: self.email)
      if person
        puts person
        self.clearbit_result = person
      end
    end
  end
  
end
