class User < ActiveRecord::Base
  
  strip_attributes
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
         
  has_many :pastes
  
  validates_format_of :username, with: /\A[a-zA-Z][a-zA-Z0-9_\.]+\z/


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end         
end
