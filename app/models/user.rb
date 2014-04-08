class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :full_name
  validates_presence_of :username
  validates_uniqueness_of  :username

  has_attached_file :avatar, :styles => { :medium => "73x73>", :thumb => "48x48>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  #Relationships <3
  has_many :tweets, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  def to_param
    username
  end

  # New Find Case Insinsitive Find For users
  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def feed
    Tweet.from_users_followed_by(self)
  end
end
