class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence :true
  validates :content, presence :true, length: { maximum: 140 } #posts are capped at 140 characters
  default_scope -> {order(create_at: :desc) } #newest posts first
  

end
