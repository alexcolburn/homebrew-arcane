require 'formula'

class Mpir < Formula
  homepage 'http://mpir.org/'
  url 'http://mpir.org/mpir-2.7.0-alpha12.tar.bz2'
  sha1 '6a46071d007a5284dbb67c4db70306deeb3e6513'
  version '2.7.0'

  option '32-bit'
  option 'skip-check', 'Do not run `make check` to verify libraries'


  def install
    if MacOS.prefer_64_bit? and not build.build_32_bit?
        ENV['ABI'] = '64'
    else
        ENV['ABI'] = '32'
    end

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
            "--enable-cxx", "--enable-gmpcompat",
            "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    system "make", "check" unless build.include? "skip-check"
  end
end
