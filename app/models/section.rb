class Section < ApplicationRecord
  has_many :skills, :dependent => :destroy

  accepts_nested_attributes_for :skills, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  validates :name, presence: true
end
