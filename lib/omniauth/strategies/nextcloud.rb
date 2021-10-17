# frozen_string_literal: true

require "rexml/document"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Nextcloud < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, :nextcloud

      option :site_url, nil

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {}

      def merged_client_options
        overrides = options.client_options
        {
          site: overrides.site || "#{options.site_url}/index.php/apps/oauth2",
          authorize_url: overrides.authorize_url || "#{options.site_url}/index.php/apps/oauth2/authorize",
          token_url: overrides.token_url || "#{options.site_url}/index.php/apps/oauth2/api/v1/token"
        }
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize(merged_client_options))
      end

      # You may specify that your strategy should use PKCE by setting
      # the pkce option to true: https://tools.ietf.org/html/rfc7636
      # option :pkce, true

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info["ocs"]["data"]["id"] }

      info do
        {
          name: raw_info["ocs"]["data"]["display-name"],
          email: raw_info["ocs"]["data"]["email"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        @raw_info ||= Hash.from_xml(access_token.get("/ocs/v2.php/cloud/user").body)
      end
    end
  end
end
