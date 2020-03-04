class Post < ApplicationRecord
    validates :category_id, presence: true
    validates :picture, presence: true

    belongs_to :user
    belongs_to :category
    has_many :post_combinations
    has_many :combinations, through: :post_combinations
    has_one_attached :picture
end
