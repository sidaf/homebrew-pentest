require 'formula'

class Dirb < Formula
  homepage 'http://dirb.sourceforge.net/'
  url "http://downloads.sourceforge.net/project/dirb/dirb/2.22/dirb222.tar.gz"
  sha256 "f3748ade231ca211a01acbec31cc6a3b576f6c56c906d73329d7dbb79f60fc2c"
  version "2.2-20161120"
  revision 3

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "curl" => :build

  def install
    system "chmod", "-R", "744", "dirb222"

    cd "dirb222" do
      inreplace "src/dirb.c", "/usr/share/dirb/wordlists/common.txt", "/usr/local/share/dirb/wordlists/common.txt"
      inreplace "src/dirb.c", "/usr/share/dirb/wordlists/vulns/apache.txt", "/usr/local/share/dirb/wordlists/vulns/apache.txt"

      system "./configure", "--prefix=#{prefix}"
      system "make"
      system "make", "install"
      pkgshare.install Dir["wordlists"]
    end
  end
end
