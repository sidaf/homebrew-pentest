require 'formula'

class HashcatBin < Formula
  homepage 'http://hashcat.net/hashcat/'
  url "https://hashcat.net/files/hashcat-3.6.0.7z"
  sha256 "84ad1d952081effe32e0f2293fdce65961bb0c5c219026f2a6466c1f99bac8fb"

  depends_on 'p7zip' => :build

  def install
    cd "hashcat-#{version}" do
      pkgshare.install Dir['*']
      if Hardware::CPU.is_64_bit?
	      bin.install_symlink "#{pkgshare}/hashcat64.bin" => 'hashcat.bin'
	    else
	      bin.install_symlink "#{pkgshare}/hashcat32.bin" => 'hashcat.bin'
	    end
    end
  end
end
