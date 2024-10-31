class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "98a0f0f9658fef115b8900709f77867a9328a9318994a9f55e38fa9ba57fb2b0"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "55a6ca61f72c86260ff6d34b0819ba29bddcc9325ee3fc5bf2215e6452df4115"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "713040380ad28e6fe727ff58f563b26c74c7553fa69e67ca4a4c4b01a7885345"
    sha256 cellar: :any_skip_relocation, ventura:       "0307a48328918660da78b6febf7b507852a62e626466bb4a8098eb7190eb05d1"
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
