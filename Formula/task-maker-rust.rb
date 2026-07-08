class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.7.4.tar.gz"
  sha256 "a39645edc2f15c59b1060f0f5ca02767b1b078877df51448c93dd9c5ef641d29"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.7.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "d3808ad6afcd707af6afc8f077496c8c94b59e0c74f934565c55b15aa0dbe311"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "67dc8799fabaef228ba0088ce20e1020b6431f1e6a692e71bdfafbfec60af383"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0561566a1a327ca1e99a7eba4fded50a6e3a2e944a72914677f835865dc5dd0e"
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
