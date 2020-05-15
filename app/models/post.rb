class Post < ApplicationRecord
belongs_to :category
belongs_to :admin_user
has_many :post_comments, :dependent => :destroy#if a post get deleted all comments would be deleted too
end
