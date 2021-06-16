class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.bigint :follower_id
      t.bigint :followed_id
      t.timestamps
    end

    add_foreign_key :followings, :users, column: 'follower_id'
    add_foreign_key :followings, :users, column: 'followed_id'

    add_index :followings, :follower_id
    add_index :followings, :followed_id

  end
end
