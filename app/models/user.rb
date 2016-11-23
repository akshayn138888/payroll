class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :time_sheets

  def address
  	"#{street}, #{city}, #{state}, #{country}, #{zipcode}"
  end

  def csc
    "#{city}, #{state}, #{country}"
  end

  def scsc
    "#{street}, #{city}, #{state}, #{country}"
  end

end
