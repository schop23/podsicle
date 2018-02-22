class Comment < ActiveRecord::Base
  default_scope { order('updated_at DESC') }
  belongs_to :post
  belongs_to :user

end
