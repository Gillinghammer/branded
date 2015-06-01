class Lookup < ActiveRecord::Base
  has_many :searches, foreign_key: "lookup_id", dependent: :destroy
  extend FriendlyId
  friendly_id :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def poll_clearbit
    puts "polling clearbit"
    unless self.clearbit_result
      person = Clearbit::Streaming::Person.find(email: self.email)
      if person
        puts "Clearbit result found saving to search result"
        puts person
        self.clearbit_result = person
        self.save
      end
    end
  end

end
