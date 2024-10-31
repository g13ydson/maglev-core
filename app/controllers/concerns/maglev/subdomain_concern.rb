module Maglev
  module SubdomainConcern
    extend ActiveSupport::Concern

    included do
      helper_method :current_site
    end

    def current_site
      @current_site ||= request.env["current_site"]
    end
  end
end
