class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.8.tar.gz"
  sha256 "6426bf47ba57449b2e9209b72e29a6201381d869536a4751c04f61234880f2b4"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.7"
    sha256                               arm64_sequoia: "7980d22a255c2b54ae69f97adf7712a6ff78690b48842d2ed079c69abc90240e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4d8a377c5b81ffba94061661956b2963ce1a779f3806a52edc858c8f2128184c"
    sha256 cellar: :any_skip_relocation, ventura:       "d76ec73e6df571c07636c29f26e88db2e01e0a887a3cf8f39863384c3b065a08"
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
