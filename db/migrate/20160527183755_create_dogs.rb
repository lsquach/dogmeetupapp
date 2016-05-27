class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :size
      t.string :image
      t.string :bio
      t.string :breed

      t.timestamps null: false
    end
  end
end
