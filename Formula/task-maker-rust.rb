class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.4.tar.gz"
  sha256 "599e96e380dde2c3dda486b6967a426a8edc9886e53cf178b2a9b7c48a7094d6"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur:  "82fde02423d796c16557ea075f0225e016a83a9d7404bf9a112df9e72d252a55"
    sha256 cellar: :any_skip_relocation, catalina: "9bb15033c7a2e525dfddde9b15e948c829f3e4bee8f7e5f240c0eacf80f43a2e"
  end

  depends_on "rust" => :build

  def install
    ENV["TM_DATA_DIR"] = share
    share.install Dir["data/*"]

    inreplace "Cargo.toml", "\"task-maker\"", "\"task-maker-rust\""
    system "cargo", "install", "--bins", *std_cargo_args

    system bin/"task-maker-tools", "gen-autocompletion"
    bash_completion.install "target/autocompletion/task-maker-rust.bash"
    fish_completion.install "target/autocompletion/task-maker-rust.fish"
    zsh_completion.install "target/autocompletion/_task-maker-rust"
  end
end
