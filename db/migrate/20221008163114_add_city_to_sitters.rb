class AddCityToSitters < ActiveRecord::Migration[7.0]
  def change
    add_column :sitters, :city, :string
  end
end
