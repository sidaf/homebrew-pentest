require "formula"

class SecLists < Formula
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists", :using => :git, :revision => "412603a"
  head "https://github.com/danielmiessler/SecLists", :using => :git, :branch => "master"
  version "1.2"

  def install
    pkgshare.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    The SecLists lists can be found in #{HOMEBREW_PREFIX}/share/sec_lists
    EOS
  end
end
