class User < ActiveRecord::Base
  has_secure_password
  belongs_to :unidade


  def self.authenticate(u,p)
    user = User.find_by_matricula(u)
    # If the user exists AND the password entered is correct.
    return user if user && user.authenticate(p)
  end

end
