# frozen_string_literal: true

require_relative "lib/hr_tool/version"

Gem::Specification.new do |spec|
  spec.name = "hr_tool"
  spec.version = HrTool::VERSION
  spec.authors = ["Charith Lakmina"]
  #spec.email = [""]

  spec.summary = ""
  spec.description = ""
  #spec.homepage = ""
  spec.required_ruby_version = ">= 3.0.0"

  #spec.metadata["allowed_push_host"] = ""

  # spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = ""
  #spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.files         = Dir["lib/**/*", "bin/*", "data/employees.json"]
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec"
  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
