class TaskMakerRust < Formula
  desc "Improved version of cmsMake, rewritten in Rust"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.3.tar.gz"
  sha256 "6d65bfb202681867c1ac12a8c1f0e452eb0873388ddfee6710374045424624d7"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.3"
    sha256 cellar: :any_skip_relocation, big_sur:  "90aab72a6e56226b4094238f3b6d3b998bc64add8da7838ea85dd1b563c1d029"
    sha256 cellar: :any_skip_relocation, catalina: "3c163e5360e0f24ba07d64670ddd20fecf2522f8e64c4ba7c6610a3cb8a13343"
  end

  depends_on "rust" => :build

  def install
    ENV["TM_DATA_DIR"] = share
    share.install Dir["data/*"]

    inreplace "Cargo.toml", "\"task-maker\"", "\"task-maker-rust\""
    system "cargo", "install", "--bins", *std_cargo_args

    system "#{bin}/task-maker-tools", "gen-autocompletion"
    bash_completion.install "target/autocompletion/task-maker-rust.bash"
    fish_completion.install "target/autocompletion/task-maker-rust.fish"
    zsh_completion.install "target/autocompletion/_task-maker-rust"
  end
end
