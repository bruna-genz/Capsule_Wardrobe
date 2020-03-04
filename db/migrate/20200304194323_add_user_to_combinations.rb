class AddUserToCombinations < ActiveRecord::Migration[6.0]
  def change
    add_reference :combinations, :user, null: false, foreign_key: true
  end
end
