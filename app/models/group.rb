class Group < ActiveRecord::Base
  has_and_belongs_to_many :characters
  has_many :events, -> { order(:time) }
  has_many :polls, as: :belongs_to
  
  validates :name, presence: true
end
