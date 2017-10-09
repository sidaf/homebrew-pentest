require "formula"

class BabelSf < Formula
  homepage "https://github.com/attackdebris/babel-sf"
  url "https://github.com/attackdebris/babel-sf", :using => :git, :revision => "ee58aa7"
  version "0.20170726"

  def install
    pkgshare.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    The Babel Scripting Framework scripts can be found in #{HOMEBREW_PREFIX}/share/babel-sf
    EOS
  end
end
