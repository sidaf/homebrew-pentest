require "formula"

class Nishang < Formula
  homepage "http://github.com/samratashok/nishang"
  head "https://github.com/samratashok/nishang", :using => :git, :branch => "master"
  url "https://github.com/samratashok/nishang", :using => :git, :revision => "620a2c0"
  version "0.6.7"

  def install
    pkgshare.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    The Nishang scripts can be found in #{HOMEBREW_PREFIX}/share/nishang
    EOS
  end
end
