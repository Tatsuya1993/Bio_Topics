class Topic < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
  # 直接SQLを引数として与える:desc
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title,   presence: true
  
  def favorite(user)
    favorites.create(user_id: user.id)
  end
  
  def unfavorite(user)
     favorites.find_by(user_id: user.id).destroy
  end
  
  def favorite?(user)
    favorite_users.include?(user)
  end
  
  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
  def self.content_intro
    @topic = Topic.find(params[:id])
    @topic.content[0..10]
  end
end
