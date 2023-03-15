cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.0"
  sha256 arm:   "3ed78b2fe0fe539ac7761ed5ce0b2a23b87a0b76060cb5d201dbb989dbd83dfc",
         intel: "d73b677c0fd16f7d6737c494d68c11d1446186a61d4a0154da910561f0de6802"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
