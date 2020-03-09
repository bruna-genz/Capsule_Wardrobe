class CreateCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :combinations do |t|
      t.string :name
      t.timestamps
    end
  end
end
