require 'formula'

class Enum4linux < Formula
  homepage 'https://labs.portcullis.co.uk/tools/enum4linux/'
  url 'https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz'
  sha256 '41334df0cb1ba82db9e3212981340372bb355a8160073331d2a1610908a62d85'
  revision 1

  depends_on "perl"
  depends_on "polenum"

  def install
    bin.install "enum4linux.pl"
  end

  def caveats; <<-EOS.undent
    Addional dependancies are required, install either via brew or alternate methods such as apt or dnf.
      - samba (rpcclient, net, nmblookup, and smbclient)
    EOS
  end
end
