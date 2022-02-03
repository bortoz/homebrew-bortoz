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
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.2"
    sha256 cellar: :any_skip_relocation, big_sur:  "246f3e80e7c578050d20d8b385fc505cf92656c48e8ab9b3ad8bdc4e8336c4dd"
    sha256 cellar: :any_skip_relocation, catalina: "834aa1aa35e0d20758166fdfc4815470ae5d86c1ce04b6c0e13d2356a8b22f21"
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
