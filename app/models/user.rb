class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_uniqueness_of :name

    has_attached_file :avatar, styles: { medium: "300x300#", thumb: "150x150>" }, :default_url => ActionController::Base.helpers.asset_path('head.jpeg')
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :posts
  has_many :comments

  belongs_to :users

def self.search(search)
  if search
    where(['user_id: LIKE ?', "%#{search}%"])
  else
    all
  end
end

end
