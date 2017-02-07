class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :week, :presence => true
  has_many :chapters
  belongs_to :course
end
