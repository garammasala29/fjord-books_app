# frozen_string_literal: true

class CreateFollowingRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :following_relationships do |t|
      t.integer :following_id, null: false
      t.integer :follower_id, null: false

      t.timestamps
    end
    add_index :following_relationships, :following_id
    add_index :following_relationships, :follower_id
    add_index :following_relationships, %i[following_id follower_id], unique: true
  end
end
