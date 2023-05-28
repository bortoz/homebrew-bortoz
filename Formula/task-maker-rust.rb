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
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.10"
    sha256 cellar: :any_skip_relocation, ventura:  "d4a0fca5561e98714a1cb0daae3b06ad71718aab989ff8bc8b47b2d6267f7034"
    sha256 cellar: :any_skip_relocation, monterey: "371d6ef9be686bcb1cbfdd9fb5e08f10e18451731fa8d88f51d1e1d15292b950"
    sha256 cellar: :any_skip_relocation, big_sur:  "133f6a0eea831fc106544d89ffd806204e2ba1b8913c08c151ed67e5b7980665"
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
