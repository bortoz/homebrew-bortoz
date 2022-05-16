class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.5.tar.gz"
  sha256 "d146eefb041e55083da145a948d3a81bd722f8e401852c80bedf98575967b439"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.4"
    sha256 cellar: :any_skip_relocation, big_sur:  "12f6ddc8c34d1e6f79751c7d2bf0357a80da71591352ce4f9cc6bb66d36fd769"
    sha256 cellar: :any_skip_relocation, catalina: "78f307518f25a62f51721360483ef510627642e426ece0aab00bf0c632a4ce37"
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
