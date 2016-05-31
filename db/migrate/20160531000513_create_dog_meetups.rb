class CreateDogMeetups < ActiveRecord::Migration
  def change
    create_table :dog_meetups do |t|
      t.references :meetup, index: true, foreign_key: true
      t.references :dog, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
