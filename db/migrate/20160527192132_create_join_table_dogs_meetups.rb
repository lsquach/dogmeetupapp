class CreateJoinTableDogsMeetups < ActiveRecord::Migration
  def change
    create_join_table :dogs, :meetups do |t|
      t.index [:dog_id, :meetup_id]
      t.index [:meetup_id, :dog_id]
    end
  end
end
