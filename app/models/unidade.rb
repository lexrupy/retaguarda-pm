class Unidade < ActiveRecord::Base
  has_many :users
  has_many :opos
  has_many :apenados
end
