class AddSearchTermToFilters < ActiveRecord::Migration[5.2]
  def up
    add_column :filters, :search_term, :string
  end

  def down
    remove_column :filters, :search_term
  end
end
