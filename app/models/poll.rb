class Poll < ActiveRecord::Base
  has_many :poll_options
  has_and_belongs_to_many :roles
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
