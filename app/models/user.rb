class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Adding association to places table for user_id
  has_many :places
  # Adding association to comments table for user_id
  has_many :comments
  # Adding association to photos table for user_id
  has_many :photos
end
