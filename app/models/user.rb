class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :Administrativo, :Presidente ]

  def self.search(query)
    return User.joins(:user).where('upper(name) like ?', "%#{query.upcase}%")
  end

end
