class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.17.tar.gz"
  sha256 "beb01f70fdd695f28d379efbb23e6b3475f6bd334baaa42b1916e2ef8a2a79b9"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9a04f4a44d1bb24a76c768a5a741ee6d9f704c64d7a46755b8f98dc02c7fbaad"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "37cb37430eabc62ba0a3474fa92f5a16bcce8991c8bb6bce204d5de2a4926193"
    sha256 cellar: :any_skip_relocation, ventura:       "745f3093bf5668a83a97d12f0ec3d834ceeb47925a30cce7fe85ded13f7de7da"
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
