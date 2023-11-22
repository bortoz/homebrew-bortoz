cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.4"
  sha256 arm:   "59147ce5cef71799ca664deec37938adbd8fc3fc6b94966aeda3f435f12ad129",
         intel: "bbd7363ef6c1ecb7732ff34598abc836998623713b9413ad4ed667cc4537e04e"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
