require "formula"

class Whatweb < Formula
  homepage "https://github.com/urbanadventurer/WhatWeb"
  url "https://github.com/urbanadventurer/WhatWeb", :using => :git, :revision => '039768f'
  version "0.4.8-20161009"
  revision 1

  depends_on "ruby@2.3"

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

    (buildpath/"Gemfile").write <<-EOS.undent
      source 'https://rubygems.org'

      gem 'json'
    EOS

    ENV["GEM_HOME"] = "#{buildpath}/vendor/bundle"
    system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby", "#{buildpath}/vendor/bundle/bin/bundle", "install", "--no-cache", "--path", "vendor/bundle"

    (bin/"whatweb").write <<-EOS.undent
      #!/usr/bin/env bash
      export GEM_HOME="#{libexec}/vendor/bundle"
      export BUNDLE_GEMFILE=#{libexec}/Gemfile
      #{libexec}/vendor/bundle/bin/bundle exec #{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/ruby #{libexec}/whatweb "$@"
    EOS
    libexec.install Dir['*']
    libexec.install ".bundle"
  end
end
