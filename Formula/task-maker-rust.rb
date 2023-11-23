class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/refs/tags/v0.5.13.tar.gz"
  sha256 "cd1b6780a8bff167d1b387a31802b6956a53ffb464e0e4b1d06e5721e17f62ea"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.13"
    sha256 cellar: :any_skip_relocation, ventura:  "4f0f36e36eab1b52395204530eef43afcc1762bff8e32f0525d13e8e1883e36f"
    sha256 cellar: :any_skip_relocation, monterey: "54ebb4ce7cb9223cb49044b70738463bc370689a4679ff8e382635bc9f270e71"
    sha256 cellar: :any_skip_relocation, big_sur:  "8dff4d8297405f3e914ab07f02cc920e68c9f368a7389c9ca423fb8f3720e80a"
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
