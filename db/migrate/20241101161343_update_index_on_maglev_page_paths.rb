class UpdateIndexOnMaglevPagePaths < ActiveRecord::Migration[7.2]
  def change
    def change
      # Remove the existing index on [:canonical, :locale, :value]
      remove_index :maglev_page_paths, name: "canonical_speed"

      # Add a new index that includes :maglev_page_id as well
      add_index :maglev_page_paths, [:canonical, :locale, :value, :maglev_page_id], name: "canonical_speed"
    end
  end
end
