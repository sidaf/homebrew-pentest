require 'formula'

class Yersinia < Formula
  homepage 'http://www.yersinia.net'
  url 'http://www.yersinia.net/download/yersinia-0.7.3.tar.gz'
  sha256 '042abc466c5b470b97079e0049b4029a8cbb75d583cfbfb756fca76e460d40b4'
  revision 1

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on 'libnet'

  def install
    system "./configure", "--with-libnet-includes=#{HOMEBREW_PREFIX}/include",
  			   "--with-pcap-includes=/usr/include/pcap",
  			   "--disable-gtk",
           "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
