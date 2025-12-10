class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.20.tar.gz"
  sha256 "990df082eee17c19268d57956708d253c6fbffce23075a105aeb885381d33bc3"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.19"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f0131072449600ffe0dd9d872530376f3686a5f593cf1388dd65103ec284006"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c00cde147b1f13c0fdbf74627caefe7f3c62affb77a0208f625f5acb156480ed"
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
