# frozen_string_literal: true

module Maglev
  class FetchSectionsPath
    include Injectable

    dependency :fetch_theme
    dependency :context

    def call
      "theme/#{site&.theme_id}"
    end

    protected

    def site
      @site ||= context&.site
    end
  end
end
