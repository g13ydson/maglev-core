class AddSlugToSites < ActiveRecord::Migration[7.2]
  def change
    add_column :maglev_sites, :slug, :string, default: "default", null: false
    add_index :maglev_sites, :slug
  end
end
