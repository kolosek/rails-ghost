class AddSourceUrlToForms < ActiveRecord::Migration[7.1]
  def change
    add_column :forms, :source_url, :string
  end
end
