# frozen_string_literal: true

class AddTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time, :integer, null: false, default: 12
  end
end
