require 'formula'

class Frogger < Formula
  homepage 'https://github.com/commonexploits/vlan-hopping'
  url 'https://github.com/commonexploits/vlan-hopping', :using => :git, :revision => 'ab6bde0'
  version '2.0-20160922'

  depends_on "arp-scan"
  depends_on "nmap"
  #depends_on "yersinia"

  def install
    bin.install "frogger2.sh"
  end

  def caveats; <<-EOS.undent
    Addional dependancies are required, install either via brew or alternate methods such as apt or dnf.
      - tshark
      - screen
      - vconfig
      - yersinia
      - snmpwalk
    EOS
  end
end
