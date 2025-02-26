class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.6.tar.gz"
  sha256 "b1337916d49ef0d2abcbd6f5b323caa7d87f2f976022d6d92f99872d58f58798"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "426ed1156f7f213c3dbadb44ab8be7e5997c7b5f68f8660ecd247365a3ddb906"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f4402d2cf80faa026e2d17444d9309d3ca813f98a079d08473c8cbd77fe7d1aa"
    sha256 cellar: :any_skip_relocation, ventura:       "042b01a16825ef8688f2a208a796a44faa23bbb3c45bbdc55ea59b72aec4e6e4"
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
