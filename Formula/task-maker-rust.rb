class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.5.tar.gz"
  sha256 "313ab65947a40062b53bac4c0e8adf3ca678eeed132b147e26581f6bd843ad45"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b3d88bded47d59d0954767272820aec00007b9786b6d2daf251d76f5b2966182"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "706ec1c2be9ffcaa01e230ec876c415a63d91662c766fd1ace82cad5290d143c"
    sha256 cellar: :any_skip_relocation, ventura:       "2b12403cfbbecb4a8b612c6a2ad2bd7cfb75d95c0ab1e9fc89febfeb88241f45"
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
