require "formula"

class Cewl < Formula
  homepage "https://github.com/digininja/CeWL/"
  url "https://github.com/digininja/CeWL/", :using => :git, :revision => 'e102a5c'
  version "5.3"
  revision 3

  depends_on "ruby@2.3"
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "exiftool"

  resource "bundler" do
    url "https://rubygems.org/downloads/bundler-1.14.3.gem"
    sha256 "9d61c7d983b99eb0b16d64658b182e045bcdd74ef3b139e849777f780782dbfe"
  end

  def install
    (buildpath/"vendor/bundle").mkpath
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/gem", "install", r.cached_download, "--no-document",
             "--install-dir", "vendor/bundle")
    end

    ENV["GEM_HOME"] = "#{buildpath}/vendor/bundle"
    system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby", "#{buildpath}/vendor/bundle/bin/bundle", "install", "--no-cache", "--path", "vendor/bundle"

    inreplace "cewl.rb", "require './cewl_lib'", "require '#{libexec}/cewl_lib'"
    inreplace "fab.rb", "require \"./cewl_lib.rb\"", "require '#{libexec}/cewl_lib.rb'"

    (bin/"cewl.rb").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{libexec}/vendor/bundle"
      export BUNDLE_GEMFILE="#{libexec}/Gemfile"
      #{libexec}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{libexec}/cewl.rb "$@"
    EOS
    (bin/"fab.rb").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{libexec}/vendor/bundle"
      export BUNDLE_GEMFILE="#{libexec}/Gemfile"
      #{libexec}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{libexec}/fab.rb "$@"
    EOS
    libexec.install Dir['*']
    libexec.install ".bundle"
  end
end
