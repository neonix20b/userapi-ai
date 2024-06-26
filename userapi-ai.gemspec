# frozen_string_literal: true

require_relative "lib/userapi/version"

Gem::Specification.new do |spec|
  spec.name = "userapi-ai"
  spec.version = UserapiAi::VERSION
  spec.authors = ["Denis Smolev", "Nikita Zdr"]
  spec.email = ["smolev@me.com"]

  spec.summary = "Userapi.ai (midjourney) + Ruby."
  spec.description = "This library provides a convenient way to interact with the Midjourney via API offered by the UserAPI.ai website. All major methods are available, including: imagine, describe, upscale, variations, inpaint (vary region), pan, zoom, and reroll, working in the remix mode."
  spec.homepage = "https://ai.oxteam.me"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/neonix20b/userapi-ai"
  spec.metadata["changelog_uri"] = "https://github.com/neonix20b/userapi-ai/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1"
  spec.add_dependency "faraday-multipart", ">= 1"
end
