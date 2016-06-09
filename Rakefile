require 'bundler/gem_tasks'
require 'crunch/recipes'

desc 'Compile all recipes'
task :compile do
  sh 'ruby ext/crunch/extconf.rb'
end

module Helpers
  module_function

  def binary_gemspec(platform = Gem::Platform.local)
    gemspec = eval(File.read 'crunch.gemspec')
    gemspec.platform = platform
    gemspec
  end

  def binary_gem_name(platform = Gem::Platform.local)
    File.basename binary_gemspec(platform).cache_file
  end
end

desc "Build #{Helpers.binary_gem_name} into the pkg directory"
task binary: :compile do
  gemspec = Helpers.binary_gemspec
  gemspec.extensions.clear

  # We don't need most things for the binary
  gemspec.files  = `git ls-files lib`.split("\n")
  gemspec.files += ['LICENSE.txt', File.join('lib', '.paths.yml')]
  gemspec.files += `git ls-files -o ports`.split("\n")

  FileUtils.mkdir_p 'pkg'

  package = if Gem::VERSION < '2.0.0'
    Gem::Builder.new(gemspec).build
  else
    require 'rubygems/package'
    Gem::Package.build gemspec
  end

  FileUtils.mv package, 'pkg'
end

task :clean do
  sh 'git clean -dxf -e .bundle -e vendor/bundle'
end

desc 'Download all recipe archives'
task :download do
  Crunch.recipes.each(&:download)
end

task build: [:clean, :download]

task default: [:compile]
