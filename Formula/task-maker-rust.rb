class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.6.16.tar.gz"
  sha256 "9b9572d4a00672f21acede9293d8be07b911b4a03264086b6e25298c2ee38938"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.6.14"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ecc45bde043c5200cab8d150f4cda5f45af6d34b35152b113b2cbf3ab37dc46f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "837f54c69d52d2e5e745e25bacbc62fa31a84d7e21f04d356289d7471eeaa950"
    sha256 cellar: :any_skip_relocation, ventura:       "3384e6e0e2008b0cc37fa96c413b13dd913d78d7cd7e4187ec279a6df5e5ac4f"
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
