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

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_equal "kbt #{version}", shell_output("#{bin}/kbt --version").strip
  end
end
