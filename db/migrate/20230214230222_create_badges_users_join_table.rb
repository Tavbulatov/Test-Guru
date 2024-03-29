# frozen_string_literal: true

class CreateBadgesUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users do |t|
      t.index %i[badge_id user_id]
      # t.index [:user_id, :badge_id]
    end
  end
end
