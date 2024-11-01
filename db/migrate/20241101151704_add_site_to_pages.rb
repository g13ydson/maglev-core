class AddSiteToPages < ActiveRecord::Migration[7.2]
  def change
    add_reference :maglev_pages, :maglev_sites, foreign_key: true, null: false
  end
end
