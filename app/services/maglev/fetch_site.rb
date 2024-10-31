module Maglev
  # Fetch the site and set up the Translatable available locales
  class FetchSite
    include Injectable
    dependency :context

    def call
      return unless site

      site.tap do |site|
        change_default_locales(site)
      end
    end

    private

    def site
      @site ||= context.site
    end

    def change_default_locales(site)
      Maglev::I18n.available_locales = site.locale_prefixes
    end
  end
end
