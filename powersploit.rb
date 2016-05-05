require "formula"

class Powersploit < Formula
  homepage "https://github.com/PowerShellMafia/PowerSploit"
  head "https://github.com/PowerShellMafia/PowerSploit", :using => :git, :branch => "master"
  url "https://github.com/PowerShellMafia/PowerSploit", :using => :git, :revision => "9e771d1"
  version "3.0"

  def install
    pkgshare.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    The PowerSploit scripts can be found in #{HOMEBREW_PREFIX}/share/powersploit
    EOS
  end
end
