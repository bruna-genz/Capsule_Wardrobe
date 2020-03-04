class CreatePostCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_combinations do |t|
      t.belongs_to :post, index: true
      t.belongs_to :combination, index: true
      t.timestamps
    end
  end
end
