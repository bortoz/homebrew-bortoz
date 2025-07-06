class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.9.tar.gz"
  sha256 "d2018964461a67a6bc8ff763d7713e781402f9664eb842e1971e2145fc6ba80e"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1dbc63541033f5ea7a526004083e8ba3c4efe7447374ca4ac34f25f444207008"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a3b11b362a8d6e3eecd867d2864b92b7d4588ea53cb65d28679525a5cf0512a3"
    sha256 cellar: :any_skip_relocation, ventura:       "83b0a70fafe84702c32dd3c6d8335cab6a69cb8dca1875887477d24f321cdb18"
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
