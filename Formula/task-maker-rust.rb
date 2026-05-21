class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "67b56b4ae047b0de5ed93922508861fee809857522307b7d480427dc124341b3"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.7.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "01087141c430f4a9e2b9f98166a4e941f3c9eb28e0e994e49350b3801ed886d8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "02ea30d3ce4f32f9cc4f2a2b215e567e63acd3353500248a0e535f56787ec1c2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ef583f058ab9ca1357b277e20f8297153de7c5ca4b520697d709a6a79d7873a3"
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
