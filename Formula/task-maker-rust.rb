class TaskMakerRust < Formula
  desc "Tool for building tasks for informatics competitions"
  homepage "https://olimpiadi-informatica.github.io/task-maker-rust/"
  url "https://github.com/olimpiadi-informatica/task-maker-rust/archive/refs/tags/v0.7.4.tar.gz"
  sha256 "a39645edc2f15c59b1060f0f5ca02767b1b078877df51448c93dd9c5ef641d29"
  license "MPL-2.0"
  head "https://github.com/olimpiadi-informatica/task-maker-rust.git", branch: "master"

  livecheck do
    url :stable
  end

  bottle do
    root_url "https://github.com/bortoz/homebrew-bortoz/releases/download/task-maker-rust-0.7.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "3806492d3f30a5df65d21f004ef6bd897f295907491a5c27842df7c17436a00a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44e14be9b7e5dc3e788a11e285d39b85489bbf56ddb70e8b403b09915ad1e03d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "05cec5339588b433d12a666db2977326a93f25778ec3b12c7a414bce987075dd"
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
