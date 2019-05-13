class Section < ApplicationRecord
  has_many :skills, :dependent => :destroy

  accepts_nested_attributes_for :skills, :allow_destroy => true
  validates :name, presence: true
end
