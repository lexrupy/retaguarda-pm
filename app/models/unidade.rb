class Unidade < ActiveRecord::Base
  has_many :users
  has_many :opos
  has_many :apenados
  has_many :visits
  has_many :programas
  has_many :setores
end
