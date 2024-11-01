# frozen_string_literal: true

module Maglev
  # Generate site and its pages in the locales defined by the config file.
  class GenerateSite
    include Injectable

    dependency(:config) { Maglev.config }
    dependency :setup_pages, class: Maglev::SetupPages

    argument :name
    argument :slug
    argument :theme_id

    def call
      validate_theme
      validate_site_uniqueness

      Maglev::Site.transaction do
        create_site.tap do |site|
          setup_pages_for_site(site) if site.errors.empty?
        end
      end
    end

    private

    def validate_theme
      @theme = Maglev.local_themes.find { |theme| theme.id == theme_id }
      raise "Theme ID #{theme_id} doesn't exist" unless @theme
    end

    def validate_site_uniqueness
      raise "A Maglev Site with slug #{slug} already exists" if Maglev::Site.exists?(slug: slug)
      raise "A Maglev Site with name #{name} already exists" if Maglev::Site.exists?(name: name)
    end

    def create_site
      Maglev::Site.create(name: name, slug: slug, locales: config.default_site_locales)
    end

    def setup_pages_for_site(site)
      Maglev::I18n.available_locales = site.locale_prefixes
      Maglev::I18n.with_locale(site.default_locale_prefix) do
        setup_pages.call(site: site, theme: @theme)
      end
    end
  end
end
