class Kbt < Formula
  desc "Keyboard tester in terminal"
  homepage "https://github.com/bloznelis/kbt/"
  url "https://github.com/bloznelis/kbt/archive/refs/tags/1.0.0.tar.gz"
  sha256 "190bc6a8fcb9c9486a079a5dc3134057165de6e39fe63a3efe8ca1f726ce8398"
  license "MIT"
  head "https://github.com/bloznelis/kbt.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/kbt-1.0.0"
    sha256 cellar: :any_skip_relocation, ventura:  "c5fc85d3f2cf0bc1b33693834b848ac60631728314c948b76b48a4433b1ab7ae"
    sha256 cellar: :any_skip_relocation, monterey: "7978f4e3abd21f6f79c91b0e84434c3eddea6e0874170d29239d263eb810eb61"
    sha256 cellar: :any_skip_relocation, big_sur:  "4393a45a7fb6337830aa2d4a21ddcb178ec45babb6cc542d6462bf6246f99571"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "kbt #{version}", shell_output("#{bin}/kbt --version").strip
  end
end
