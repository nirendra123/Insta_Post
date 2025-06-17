class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    # belongs_to :parent_comment, class_name: 'comment', optional:true
    validates :description, :post_id, :user_id, presence: true

    delegate :email, to: :user, prefix: true
end
