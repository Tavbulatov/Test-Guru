# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
