class AddEditDateToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :edit_date, :date
  end
end
