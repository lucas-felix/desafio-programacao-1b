class Address < ActiveRecord::Base
  has_many :buyers

  validates :street, presence: true
end
