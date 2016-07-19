require 'formula'

class Nfsshell < Formula
  homepage 'https://github.com/NetDirect/nfsshell'
  url 'https://github.com/NetDirect/nfsshell', :using => :git, :revision => '09cdd52'
  version '0.20130510'

  def install
    ENV.deparallelize
    system "make"
    bin.install "nfsshell"
  end
end
