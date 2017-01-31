require "formula"

class HeaderCheck < Formula
  homepage "https://labs.portcullis.co.uk/tools/headercheck/"
  url "https://labs.portcullis.co.uk/download/header_check.v1.tgz"
  sha256 "58d84d5f6f0b7a0095365bf20ba2d5ae7315cf5daec48b2ec394f81a4ce0bb6d"
  version "1.0"
  revision 1

  def install
    libexec.install "header_check.py"
    (bin/"header_check.py").write <<-EOS.undent
      #!/bin/sh
      /usr/bin/env python #{libexec}/header_check.py "$@"
    EOS
  end
end
