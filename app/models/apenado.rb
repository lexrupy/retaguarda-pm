class Apenado < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true
end
