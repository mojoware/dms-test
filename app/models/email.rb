class Email < ActiveRecord::Base
  has_many :urls, dependent: :destroy
  validates :address, presence: true
  #validates :address, uniqueness: :true
  validates_format_of :address, :with=>/\A[\w.%+-]+@[\w.%+-]+\.[a-zA-Z]{2,4}\z/, :message=>'(email address) is not valid'
  accepts_nested_attributes_for :urls, :allow_destroy => true
end
