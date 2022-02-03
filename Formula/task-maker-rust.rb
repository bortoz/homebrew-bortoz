class TaskMakerRust < Formula
  desc "Improved version of cmsMake, rewritten in Rust"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.2.tar.gz"
  sha256 "f770a980ec5bb32305bebcc75a2b90a2e07b81198ac0450d9dc86c4d9f54b4fa"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.1"
    rebuild 3
    sha256 cellar: :any_skip_relocation, big_sur:  "200342fd6355c0ab50fdbf260a02fc0060b460fcc596634906fe27d7d29e7f33"
    sha256 cellar: :any_skip_relocation, catalina: "6af718eb35858861c908819f86e66523f6a312d61ed0e21307965d756142cef0"
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
