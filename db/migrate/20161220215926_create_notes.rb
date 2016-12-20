class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :body,  null: false
      t.references :user
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
