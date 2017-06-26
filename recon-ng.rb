require "formula"

class ReconNg < Formula
  homepage "https://bitbucket.org/LaNMaSteR53/recon-ng"
  url "https://bitbucket.org/LaNMaSteR53/recon-ng.git", :using => :git, :revision => "70d967e"
  version "4.9.2"

  depends_on "libxml2"
  depends_on "libxslt"

  resource "dicttoxml" do
    url "https://pypi.python.org/packages/92/14/29393b4913b53ac9b4fa5cfc84d426e85289ed4f59e21f5d990d453defbc/dicttoxml-1.6.6.tar.gz"
    sha256 "8229dcbadbe8a417b5e221b0bd56dff8a8ffd250951e6e95d51d5c5e2a77cc68"
  end

  resource "dnspython" do
    url "https://pypi.python.org/packages/b3/e3/091c6489f0b573b8a4069ce956d037061ae9321401c89323386fe748dc9f/dnspython-1.12.0.zip"
    sha256 "63bd1fae61809eedb91f84b2185816fac1270ae51494fbdd36ea25f904a8502f"
  end

  resource "jsonrpclib" do
    url "https://pypi.python.org/packages/4f/84/d07e0a8e0ff14388e864a3e5fa1e0c03766c754d480d84f875604dc8c379/jsonrpclib-0.1.3.tar.gz"
    sha256 "a594e702c35408ae5540086ab5bdea284fb27d09520898c381c5bbdbfceffbba"
  end

  resource "lxml" do
    url "https://pypi.python.org/packages/63/c7/4f2a2a4ad6c6fa99b14be6b3c1cece9142e2d915aa7c43c908677afc8fa4/lxml-3.4.4.tar.gz"
    sha256 "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
  end

  resource "mechanize" do
    url "https://pypi.python.org/packages/32/bc/d5b44fe4a3b5079f035240a7c76bd0c71a60c6082f4bfcb1c7585604aa35/mechanize-0.2.5.tar.gz"
    sha256 "2e67b20d107b30c00ad814891a095048c35d9d8cb9541801cebe85684cc84766"
  end

  resource "slowaes" do
    url "https://pypi.python.org/packages/79/a4/c7dcbe89ec22a6985790bc0effb12bb8caef494fbac3c2bab86ae51a53ef/slowaes-0.1a1.tar.gz"
    sha256 "83658ae54cc116b96f7fdb12fdd0efac3a4e8c7c7064e3fac3f4a881aa54bf09"
  end

  resource "XlsxWriter" do
    url "https://pypi.python.org/packages/18/e0/1da941ed2d17c426bd76f1cbe70c134c6563e85383c33a52122741ad8dc8/XlsxWriter-0.7.3.tar.gz"
    sha256 "2fa0f2d633bfbbc55a48abd4089820c744ed7a40e11c5c1580196a2c129eb8c6"
  end

  resource "olefile" do
    url "https://pypi.python.org/packages/8e/32/db0c062319061c6c38067823485ebc6252423cdc3c1d7dec798ad5c989f4/olefile-0.42.1.zip"
    sha256 "8a3226dba11349b51a2c6de6af0c889324201f14a8c30992b7877109090e36e0"
  end

  resource "PyPDF2" do
    url "https://pypi.python.org/packages/6e/70/c0e4809e04011b0fec5af7c89ceb694f94644ffb6ab07f9080e9aab77682/PyPDF2-1.25.1.tar.gz"
    sha256 "43d324f70f8994c25a08e6edc02ec2d5c1e84c9231d3537f785b3f97641182eb"
  end

  resource "flask" do
    url "https://pypi.python.org/packages/eb/12/1c7bd06fcbd08ba544f25bf2c6612e305a70ea51ca0eda8007344ec3f123/Flask-0.12.2.tar.gz"
    sha256 "49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1"
  end

  resource "unicodecsv" do
    url "https://pypi.python.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz"
    sha256 "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib64/python2.7/site-packages"

    %w[dicttoxml dnspython jsonrpclib lxml mechanize slowaes XlsxWriter olefile PyPDF2 flask unicodecsv].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    (bin/"recon-ng").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-ng "$@"
    EOS
    (bin/"recon-cli").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-cli "$@"
    EOS
    (bin/"recon-rpc").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-rpc "$@"
    EOS
    (bin/"recon-web").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python recon-web "$@"
    EOS
    libexec.install Dir['*']
  end
end
