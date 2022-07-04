class AddUserRefToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_reference :restaurants, :user, foreign_key: true
  end
end
