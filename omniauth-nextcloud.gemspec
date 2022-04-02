# frozen_string_literal: true

require_relative "lib/omniauth/nextcloud/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-nextcloud"
  spec.version       = Omniauth::Nextcloud::VERSION
  spec.authors       = ["Lukas_Skywalker"]
  spec.email         = ["lukas.diener@hotmail.com"]

  spec.summary       = "omniauth provider for Nextcloud"
  spec.description   = "omniauth provider for the Nextcloud API"
  spec.homepage      = "https://github.com/code-fabrik/omniauth-nextcloud"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/code-fabrik/omniauth-nextcloud"
  spec.metadata["changelog_uri"] = "https://github.com/code-fabrik/omniauth-nextcloud"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "omniauth", "2.0.4"
  spec.add_dependency "omniauth-oauth2", "1.7.2"
  spec.add_dependency "rexml", "3.2.5"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
