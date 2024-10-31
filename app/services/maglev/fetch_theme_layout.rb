# frozen_string_literal: true

module Maglev
  # Return the path of the layout folder
  class FetchThemeLayout
    include Injectable

    dependency :fetch_theme
    dependency :context

    def call
      "themes/#{site.theme_id}/layout"
    end

    protected

    def site
      @site ||= context.site
    end
  end
end
