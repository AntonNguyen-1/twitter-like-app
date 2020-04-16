class AddFollowersAndFollowingToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followers, :jsonb, array: true, default: []
    add_column :users, :following, :jsonb, array: true, default: []
  end
end
