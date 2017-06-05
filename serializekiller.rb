require "formula"

class Serializekiller < Formula
  homepage "https://github.com/johndekroon/serializekiller"
  url "https://github.com/johndekroon/serializekiller", :using => :git, :revision => "2fd258a"
  version "1.0.2-20170214"

  depends_on "nmap"

  def install
    bin.install "serializekiller.py"
  end
end
