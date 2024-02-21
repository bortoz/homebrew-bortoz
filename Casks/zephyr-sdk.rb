cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.5-1"
  sha256 arm:   "9c905561dc97f9a16f6ce20ebff87a75c61b9ea14860be8c25db467decf1efee",
         intel: "6f1166da34bd7d61b894d87df2f0f77acc9a0628d762f3115e07d85d7c3b0f92"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
