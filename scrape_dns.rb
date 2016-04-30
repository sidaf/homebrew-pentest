require 'formula'

class ScrapeDns < Formula
  homepage 'https://github.com/304GEEK/Scrape-DNS'
  url 'https://github.com/304GEEK/Scrape-DNS', :using => :git, :revision => '3df392f'
  version '1.0'

  def install
    (bin/"scrapedns").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && ./scrape.sh "$@"
    EOS

    libexec.install Dir["*"]
  end
end
