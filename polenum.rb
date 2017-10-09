require "formula"

class Polenum < Formula
  homepage "https://labs.portcullis.co.uk/tools/polenum/"
  url "https://labs.portcullis.co.uk/download/polenum-0.2.tar.bz2"
  sha256 '4362c6471f192f841f1a6349d522ddcadc51ee845e7dc7fc4655323aa90468eb'
  revision 2

  #depends_on :python

  resource "pycrypto" do
    url "https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "pyasn1" do
    url "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz"
    sha256 "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
  end

  resource "impacket" do
    url "https://pypi.python.org/packages/23/18/611a288acba72f59dce509cc3e68fe390d3bdaa00ce4d0b4686e599c951b/impacket-0.9.12.tar.gz"
    sha256 "59cd71e69ac66e6b2905d663e475772f1f94b93b039f929ba3d655a730fbd935"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib64/python2.7/site-packages"

    %w[pycrypto pyasn1 impacket].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec

    bin.install "polenum.py"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
