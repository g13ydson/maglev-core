# frozen_string_literal: true

module Maglev
  # Fetch the current theme
  class FetchTheme
    include Injectable

    dependency :context

    def call
      Maglev.local_themes.detect {|theme| theme.id == site.theme_id }
    end

    protected

    def site
      @site ||= context.site
    end
  end
end
