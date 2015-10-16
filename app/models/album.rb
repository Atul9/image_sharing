class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates_presence_of :name, :user_id
  accepts_nested_attributes_for :photos
end
