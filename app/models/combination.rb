class Combination < ApplicationRecord
    has_many :post_combinations
    has_many :posts, through: :post_combinations
end
