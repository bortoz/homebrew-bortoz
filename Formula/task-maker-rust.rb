class TaskMakerRust < Formula
    desc "The new cmsMake"
    homepage "https://edomora97.github.io/task-maker-rust/"
    url "https://github.com/edomora97/task-maker-rust/archive/v0.5.0.tar.gz"
    sha256 "ade1407368fc7884a974874d57c2bddfef13edad36ecc2cd99b6399b4ac7086b"
    head "https://github.com/edomora97/task-maker-rust.git"
    license "MPL-2.0"

    livecheck do
        url :stable
    end
  
    depends_on "rust" => :build
  
    def install
        ENV["TM_DATA_DIR"] = share

        system "cargo", "build", "--release", "--bin", "task-maker"
        system "cargo", "run", "--release", "--bin", "task-maker-tools", "gen-autocompletion"

        mv "target/release/task-maker", "target/release/task-maker-rust"
        bin.install "target/release/task-maker-rust"
        bin.install "target/release/task-maker-tools"
        share.install Dir["data/*"]

        bash_completion.install "target/autocompletion/task-maker-rust.bash"
        fish_completion.install "target/autocompletion/task-maker-rust.fish"
        zsh_completion.install "target/autocompletion/_task-maker-rust"
    end
end
