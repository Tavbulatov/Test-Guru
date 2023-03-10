class AddDescriptionToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :description, :string
  end
end
