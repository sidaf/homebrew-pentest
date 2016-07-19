require 'formula'

class Crunch < Formula
  homepage "https://sourceforge.net/projects/crunch-wordlist/"
  url "http://downloads.sourceforge.net/project/crunch-wordlist/crunch-wordlist/crunch-3.6.tgz"
  sha256 "6a8f6c3c7410cc1930e6854d1dadc6691bfef138760509b33722ff2de133fe55"

  def install
    ENV.deparallelize
    system "make"
    bin.install "crunch"
  end
end
