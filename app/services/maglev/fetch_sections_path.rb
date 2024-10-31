# frozen_string_literal: true

module Maglev
  class FetchSectionsPath
    include Injectable

    dependency :fetch_theme
    dependency :context

    def call
      "themes/#{site&.theme_id}"
    end

    protected

    def site
      @site ||= context&.site
    end
  end
end
