class Category < ApplicationRecord
    validates :name, presence: true
    has_many :posts

    default_scope -> { order(name: :asc) }
end
