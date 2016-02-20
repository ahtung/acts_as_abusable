class Abuse < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
  
  scope :pending, -> { where(confirmed: false) }
  scope :confirmed, -> { where(confirmed: true) }

  def confirm!
    self.confirmed = true
    self.save unless self.new_record?
  end
  
end
