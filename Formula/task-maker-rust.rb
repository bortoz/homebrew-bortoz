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

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.1"
    rebuild 2
    sha256 cellar: :any_skip_relocation, big_sur:  "a0a404291c055123d46b908b634a5512cd60ef563b0940f60206000900375c77"
    sha256 cellar: :any_skip_relocation, catalina: "25e1414d710d7224e9f7c1e1fa6bfb8816ac50d9ab81daf0ffbc74a950e41ec2"
  end

  depends_on "rust" => :build

  def install
    ENV["TM_DATA_DIR"] = share
    share.install Dir["data/*"]

    inreplace "Cargo.toml", "\"task-maker\"", "\"task-maker-rust\""
    system "cargo", "install", "--bins", *std_cargo_args

    system "#{bin}/task-maker-tools", "gen-autocompletion"
    bash_completion.install "target/autocompletion/task-maker-rust.bash"
    fish_completion.install "target/autocompletion/task-maker-rust.fish"
    zsh_completion.install "target/autocompletion/_task-maker-rust"
  end
end
