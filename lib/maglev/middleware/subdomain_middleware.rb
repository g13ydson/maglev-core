module Maglev::Middleware
  class SubdomainMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      find_tenant(env)
      @app.call(env)
    end

    protected

    def find_tenant(env)
      slug = env["HTTP_HOST"].split(".").first
      env["current_site"] = Maglev::Site.find_by_slug(slug) if slug
    end
  end
end
