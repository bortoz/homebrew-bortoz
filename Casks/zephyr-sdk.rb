cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.3"
  sha256 arm:   "c1147571df1063eaf2798265020e50cf46cd3c5ced9f4babecfe29e28e34e129",
         intel: "07d67d6bdfc1bd741300d540524f26569fa1ea5ec73cd3980b67ba0bfc19e82a"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
