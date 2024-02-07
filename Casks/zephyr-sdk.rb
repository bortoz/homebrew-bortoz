cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.5"
  sha256 arm:   "c42b84ff6ae888b4395c1a0162d08a8422042a8edb1fee23a39cddfe763d713d",
         intel: "2588f4ca042c5e88e61ccd82344a19ae9ddee987d7b796a3e6dcf10231ef2af9"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
