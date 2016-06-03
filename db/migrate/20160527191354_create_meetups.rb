class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :description
      t.string :location
      t.string :address
      t.string :name
      t.time :time
      t.date :meetup_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
