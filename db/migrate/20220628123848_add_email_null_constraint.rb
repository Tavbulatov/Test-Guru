# frozen_string_literal: true

class AddEmailNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :email, false)
  end
end
