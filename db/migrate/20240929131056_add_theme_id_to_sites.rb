class AddThemeIdToSites < ActiveRecord::Migration[7.2]
  def change
    add_column :maglev_sites, :theme_id, :string, default: "default", null: false
    add_index :maglev_sites, :theme_id
  end
end
