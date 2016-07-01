class Residencium < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :programa
end
