class Neo < Formula
  desc "Simulates the digital rain from \"The Matrix\""
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/st3w/neo/archive/v0.6.1.tar.gz"
  sha256 "744a88cc6b98a4625ae5c5ee819640561f3df87518be0f9fca00ad787814b200"
  license "GPL-3.0-or-later"
  head "https://github.com/st3w/neo.git", branch: "main"

  livecheck do
    url :stable
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
