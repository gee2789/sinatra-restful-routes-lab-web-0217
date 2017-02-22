class RenameTable < ActiveRecord::Migration
  def change
    rename_table :recipies, :recipes
  end
end
