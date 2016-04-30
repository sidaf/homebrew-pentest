require "formula"

class Nopc < Formula
  homepage "https://labs.portcullis.co.uk/tools/nopc/"
  url "https://labs.portcullis.co.uk/download/nopc-0.4.7.tar.bz2"
  sha256 "86895b5078f922c4a2aa24a6d4369b80030b451410fee6ac0cf838fb563c8806"
  version "0.4.7"

  def install
    bin.install "nopc.sh"
    doc.install "README.txt"
  end
end
