class TaskMakerRust < Formula
  desc "Improved version of cmsMake, rewritten in Rust"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.1.tar.gz"
  sha256 "10ef9635d70e70fb105f1c4ec7bada0e4caa3aabd61287b1bf7cc53e3b908223"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  depends_on "rust" => :build

  patch do
    url "https://gist.githubusercontent.com/bortoz/02f3c2520d9934774f0a9a4ef353253c/raw/f583d7ae867ca5ee5fbc4bed7ee80d299af8ecb7/task-maker-rust.diff"
    sha256 "7ba50d664318738f21ae14883fd197179dfc01e3128ae4105ebc6f891a74a277"
  end

  def install
    ENV["TM_DATA_DIR"] = share
    system "cargo", "install", "--bins", *std_cargo_args
    share.install Dir["data/*"]
  end
end
