require "formula"

class HostapdWpe < Formula
  homepage 'https://github.com/OpenSecurityResearch/hostapd-wpe'
  url 'https://w1.fi/releases/hostapd-2.2.tar.gz'
  sha256 'f15b6bcb434378860ea5b88dffed7f54d8cb71fff2146de0f006977a5e25a882'
  version '2.2-wpe20160401'

  patch do
    url "https://raw.githubusercontent.com/OpenSecurityResearch/hostapd-wpe/a3bc3dd9cf9a94f42d6f43de3bfa50b7045042cf/hostapd-wpe.patch"
    sha256 "5d987dde3fce5d60c0edd1e8387b76ab6e35d6842cbaedcd5522657da2a7e167"
  end

  resource "wpe" do
    url "https://github.com/OpenSecurityResearch/hostapd-wpe", :using => :git, :revision => "0b42b8b"
  end

  depends_on "openssl"
  depends_on "libnl"

  def install
    %w[wpe].each do |r|
      resource(r).stage do
        buildpath.install "certs"
      end
    end

    inreplace "hostapd/.config", /^#CONFIG_LIBNL32=y$/, "CONFIG_LIBNL32=y"
    inreplace "hostapd/.config", "#CFLAGS += -I$<path to libnl include files>", "CFLAGS += -I#{HOMEBREW_PREFIX}/include/libnl3"
    inreplace "hostapd/.config", "#LIBS += -L$<path to libnl library files>", "LIBS += -L#{HOMEBREW_PREFIX}/lib"

    cd "hostapd" do
      system "make"
    end

    cd "certs" do
      system "./boostrap"
    end

    pkgshare.install Dir["*"]
    bin.install_symlink pkgshare/"hostapd/hostapd"
  end
end
