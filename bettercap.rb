require "formula"

class Bettercap < Formula
  homepage "https://github.com/evilsocket/bettercap"
  url "https://github.com/evilsocket/bettercap", :using => :git, :revision => '62e9d8d'
  version "1.6.2"

  depends_on "ruby@2.3"
  depends_on "openssl"

  def install
    ENV["GEM_HOME"] = libexec
    system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/gem", "build", "bettercap.gemspec"
    system "#{HOMEBREW_PREFIX}/opt/ruby@2.3/bin/gem", "install", "bettercap-#{version}.gem"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end
end
