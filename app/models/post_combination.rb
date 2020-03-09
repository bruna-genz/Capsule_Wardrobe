class PostCombination < ApplicationRecord
    belongs_to :post
    belongs_to :combination
    validates :post_id, presence: true
    validates :combination_id, presence: :true
end
