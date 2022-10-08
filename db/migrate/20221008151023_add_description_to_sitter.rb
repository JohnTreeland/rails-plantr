class AddDescriptionToSitter < ActiveRecord::Migration[7.0]
  def change
    add_column :sitters, :description, :text
  end
end
