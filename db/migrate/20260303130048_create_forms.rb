class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.string :form_type, null: false
      t.string :name
      t.string :email
      t.jsonb :data, default: {}
      t.timestamps
    end

    add_index :forms, :form_type
    add_index :forms, :email
  end
end
