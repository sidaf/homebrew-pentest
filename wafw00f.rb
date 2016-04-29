require "formula"

class Wafw00f < Formula
  homepage "https://github.com/sandrogauci/wafw00f"
  url "https://github.com/sandrogauci/wafw00f", :using => :git, :revision => 'bbe6cd7'
  version "0.9.4"

  resource "beautifulsoup4" do
    url "https://pypi.python.org/packages/26/79/ef9a8bcbec5abc4c618a80737b44b56f1cb393b40238574078c5002b97ce/beautifulsoup4-4.4.1.tar.gz"
    sha256 "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4"
  end

  resource "pluginbase" do
    url "https://pypi.python.org/packages/d3/57/1e6e328c79d6ab83169999d4944bdca0616dfc556099df4678bed498ea5e/pluginbase-0.3.tar.gz"
    sha256 "d9486a2d50017551c3f0e474648b71ea2e39429720977119a437713ebae2257f"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib64/python2.7/site-packages"

    res =  %w[beautifulsoup4 pluginbase]
    res.each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec/"bin"

    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
