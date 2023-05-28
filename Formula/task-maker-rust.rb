class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.11.tar.gz"
  sha256 "231b633ac1481dd4f16d47f6b31354310c1336a8adb201fa9a3923f90e7ab45c"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.11"
    sha256 cellar: :any_skip_relocation, ventura:  "159441b18f4a4a8150d37ba4e8017e095f12cf39caaceff28d2f0fa33eb17a34"
    sha256 cellar: :any_skip_relocation, monterey: "ff94ab0f6e8ff3b04cffb766b61f16dda82564ef7d9ca037d53a0f3f8d92416f"
    sha256 cellar: :any_skip_relocation, big_sur:  "7856db2af5f6d7b83db5f71aaf263eb73e36a2f85ec040f869b249c822a0a3da"
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
