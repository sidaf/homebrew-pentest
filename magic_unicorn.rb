require "formula"

class MagicUnicorn < Formula
  homepage "https://github.com/trustedsec/unicorn"
  url "https://github.com/trustedsec/unicorn", :using => :git, :revision => "cda7383"
  version "2.9.2"

  def install
    bin.install "unicorn.py"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
