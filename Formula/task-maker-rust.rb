class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "b4c979ad8dc23fd7dd70df1d2948ff6cc683fd3fc4fedc92afcadee95729e74b"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.1"
    sha256 cellar: :any_skip_relocation, monterey: "a52b0477fe0aafaf0f352912e5b2794d6b7cc4d09b9f4bb5c5e658da79e46d0f"
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
