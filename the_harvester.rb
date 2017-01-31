require 'formula'

class TheHarvester < Formula
  homepage 'https://github.com/laramies/theHarvester'
  url 'https://github.com/laramies/theHarvester', :using => :git, :revision => '0f9a670'
  version '2.7'
  revision 1

  resource "requests" do
    url "https://pypi.python.org/packages/f9/6d/07c44fb1ebe04d069459a189e7dab9e4abfe9432adcd4477367c25332748/requests-2.9.1.tar.gz"
    sha256 "c577815dd00f1394203fc44eb979724b098f88264a9ef898ee45b8e5e9cf587f"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"

    %w[requests].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec

    (bin/"theHarvester.py").write <<-EOS.undent
      #!/usr/bin/env bash
      cd #{libexec} && PYTHONPATH=#{ENV["PYTHONPATH"]} python theHarvester.py "$@"
    EOS

    libexec.install Dir["*"]
  end
end
