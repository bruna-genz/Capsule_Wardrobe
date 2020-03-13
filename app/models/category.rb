class Category < ApplicationRecord
    validates :name, presence: true
    has_many :posts

    default_scope -> { order(created_at: :desc) }
end
