class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://edomora97.github.io/task-maker-rust/"
  url "https://github.com/edomora97/task-maker-rust/archive/v0.5.12.tar.gz"
  sha256 "ad0708c9aaf4a08732a82cef81b200f8f809e1962f39e9c450bf0ba8a52eb867"
  license "MPL-2.0"
  head "https://github.com/edomora97/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.5.12"
    sha256 cellar: :any_skip_relocation, ventura:  "aae413242212917d2aed28e8ec6544eec08d049e49e5ffaeaef98448523a184c"
    sha256 cellar: :any_skip_relocation, monterey: "be869d8cf79943361791307d907496e7eca6eedf04501a8277cb75705ddd269a"
    sha256 cellar: :any_skip_relocation, big_sur:  "ecdb49f9521f53df5bd10d50caa70f8509407460a50a06bf9fa7eb4ecd7981c2"
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
