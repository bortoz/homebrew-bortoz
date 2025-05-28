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
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5a8234c01f4f3a60c173a0f3c0ff9e68651f0b506fca98cec6fdc2e29945af81"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c6d415139efa422299777ae0128e2546411f2d41f5de7095984c730598241205"
    sha256                               ventura:       "d332a7ccd1dcc34e36f1bd528aa6f2e49849b40340fddbe8b4b58b22741f40be"
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
