class AddCityToPlayer < ActiveRecord::Migration[5.2]
  def up
    add_column :players, :city, :string
  end

  def down
    remove_column :players, :city
  end
end
