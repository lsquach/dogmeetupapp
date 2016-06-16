class DropDogsMeetupsTable < ActiveRecord::Migration
  def change
    drop_join_table :dogs, :meetups
  end
end
