require 'formula'

class HashcatUtils < Formula
  homepage 'http://hashcat.net/hashcat/'
  url 'https://github.com/hashcat/hashcat-utils/releases/download/1.2/hashcat-utils-1.2.7z'
  sha256 '4a13540cfe9e8a58a5ef55fd2db175c7bae5a6836239524f452144a82370e857'

  depends_on 'p7zip' => :build

  def install
    cd "hashcat-utils" do
      #inreplace "Makefile", /\/opt\/hashcat-toolchain\/linux32\/bin\/i686-hashcat-linux-gnu-gcc/, ENV.cc
      #inreplace "Makefile", /\$\(CFLAGS\) -m32/, '$(CFLAGS)'
      #system "make", "clean"
      #system "make", "posix"
      bin.install Dir["bin/*.bin"]
      bin.install Dir["bin/*.pl"]
    end
  end
end
