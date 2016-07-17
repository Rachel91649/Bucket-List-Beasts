class User < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of :avatar
  validates_processing_of :avatar

  private
  	def avatar_size_valididation
  		errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  	end
  

  has_many :trips
end
