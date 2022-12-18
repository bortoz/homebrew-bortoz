class Neo < Formula
  desc "Simulates the digital rain from \"The Matrix\""
  homepage "https://github.com/st3w/neo"
  url "https://github.com/st3w/neo/archive/v0.6.1.tar.gz"
  sha256 "744a88cc6b98a4625ae5c5ee819640561f3df87518be0f9fca00ad787814b200"
  license "GPL-3.0-or-later"
  head "https://github.com/st3w/neo.git", branch: "main"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/neo-0.6.1"
    sha256 cellar: :any, monterey: "263cd3cd8a852c7832a4c4ec1796ff82190908ac5b5bd9e68a645aab89c07fb3"
    sha256 cellar: :any, big_sur:  "e5baccab8b8571cfefe71755ede4a0a70bb905ddc7f9a8982df60696190ae570"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "make" => :build
  depends_on "ncurses"

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
