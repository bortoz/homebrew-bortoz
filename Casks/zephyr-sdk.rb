cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.1"
  sha256 arm:   "55ffc6b7376fdb5c7bfb6d33c846049e6c0f8ad6262f864294fc42d4059b1a26",
         intel: "b046c7be2b90eea30f1fd907afe0f0802167030eb63560b129f263d9a5754dda"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
