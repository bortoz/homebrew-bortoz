class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.13.tar.gz"
  sha256 "6aef5a2d410871ef40d14035ef8d8989ce357d6e2e8bf3b03654d89a55441c18"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d07fd22ca2b580c9a744f1019c76438a8cd743db3c50cbe53187b14b80b5344b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "42b2b84d37a1a66dadec37f0a30945445a5305a5bdf9feae7cda2ec346fc0b98"
    sha256 cellar: :any_skip_relocation, ventura:       "f9dc7d581ebd3dfe33281a27d5ec71c36ad5ecc5b821b52925e68703a608bc56"
  end

  depends_on "rust" => :build

  def install
    ENV["TM_DATA_DIR"] = share
    share.install Dir["data/*"]

    inreplace "Cargo.toml", "\"task-maker\"", "\"task-maker-rust\""
    system "cargo", "install", "--bins", *std_cargo_args

    system bin/"task-maker-tools", "gen-autocompletion"
    bash_completion.install "target/autocompletion/task-maker-rust.bash"
    bash_completion.install "target/autocompletion/task-maker-tools.bash"
    fish_completion.install "target/autocompletion/task-maker-rust.fish"
    fish_completion.install "target/autocompletion/task-maker-tools.fish"
    zsh_completion.install "target/autocompletion/_task-maker-rust"
    zsh_completion.install "target/autocompletion/_task-maker-tools"
  end
end
