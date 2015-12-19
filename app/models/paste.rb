require 'securerandom'
class Paste < ActiveRecord::Base
  
  strip_attributes
  
  belongs_to :user
  belongs_to :parent, :class_name => name
  
  before_create :set_creator
  before_create :set_creator_ip
  before_create :generate_guid
  
  def set_creator
    self.user = $current_user
  end
  
  def set_creator_ip
    self.ip = $request.remote_ip
  end
  
  def generate_guid
    self.guid = SecureRandom.uuid
  end

  ###############
  ### Display ###
  ###############  
  def display_creator
    user ? user.username : I18n.t("railsbin.guest")
  end
  
end
