# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Corels < Formula
  desc "Certifiably Optimal Rule Lists. C-library to build a certifiably optimal rule list from input data and labels."
  homepage "https://github.com/margoseltzer/corels-homebrew/wiki"
  url "https://github.com/margoseltzer/corels-homebrew/files/1441466/corels-1.0.tar.gz"
  version "1.0"
  sha256 "013fd81472759a4e8f7ae8dec9ce4a9769286d41cd3ff33c5fc9bfb668a70b7d"
  # depends_on "cmake" => :build
  depends_on "gsl"
  depends_on "gmp"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/corels", "-b", "#{share}/corels/compas_test.out", "#{share}/corels/compas_test.label"
  end
end
