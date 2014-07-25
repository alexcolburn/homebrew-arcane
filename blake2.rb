require "formula"

class Blake2 < Formula
  homepage "https://blake2.net/"
  url "https://blake2.net/libb2-0.96.tar.gz"
  sha1 "e52ce4c788a972e3a49bbbe4380331030c4aca32"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
