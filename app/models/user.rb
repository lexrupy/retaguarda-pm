class User < ActiveRecord::Base
  has_secure_password
  belongs_to :unidade
  before_save :reset_pwd_if_needed

  attr_accessor :reset_pwd
  attr_accessor :old_password

  def self.authenticate(u,p)
    user = User.find_by_matricula(u)
    # If the user exists AND the password entered is correct.
    return user if user && user.authenticate(p)
  end

  def nome_unidade
    unidade.nome if unidade
  end

  def reset_password
    self.password = matricula
    self.password_confirmation = matricula
  end

  def reset_pwd_if_needed
    if self.reset_pwd.to_i == 1
      reset_password
    end
  end

end


