class Unidade < ActiveRecord::Base
  has_many :users
  has_many :opos
end
