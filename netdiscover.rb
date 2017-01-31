require "formula"

class Netdiscover < Formula
  homepage "http://nixgeneration.com/~jaime/netdiscover/"
  url "http://archive.debian.org/debian/pool/main/n/netdiscover/netdiscover_0.3beta6.orig.tar.gz"
  sha256 "19c367f823c49999e2c05c485cac0a5d5685d23c6b33deae1e957406571924db"
  version "0.3-beta6"
  revision 1

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libnet"

  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "(#{sbin}/netdiscover --help; true)"
  end
end

__END__
diff --git a/configure b/configure
index 7e840a3..8ad268a 100755
--- a/configure
+++ b/configure
@@ -2026,8 +2026,6 @@ case "${target_os}" in
     echo "system supporting libcap and libnet, please mail me"
     echo "at jpenalbae@gmail.com for compilation errors."
     echo "======================================================"
-    echo  -n "Type enter to continue. "
-    read NONE
 esac
 
 DEPDIR="${am__leading_dot}deps"
diff --git a/configure.in b/configure.in
index 8e1cdbb..a362524 100644
--- a/configure.in
+++ b/configure.in
@@ -29,8 +29,6 @@ case "${target_os}" in
     echo "system supporting libcap and libnet, please mail me"
     echo "at jpenalbae@gmail.com for compilation errors."
     echo "======================================================"
-    echo  -n "Type enter to continue. "
-    read NONE
 esac
 
 AC_ISC_POSIX

