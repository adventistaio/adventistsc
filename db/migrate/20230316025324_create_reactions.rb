class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.integer :reaction, null: false
      t.string :type, null: false
      t.references :user, null: false, foreign_key: true
      t.references :reactable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
