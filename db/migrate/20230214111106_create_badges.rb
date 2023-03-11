class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :url_picture, null: false
      t.string :rule, null: false
      t.string :rule_criterion, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
