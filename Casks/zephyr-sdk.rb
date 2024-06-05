cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.16.8"
  sha256 arm:   "e06138c1e50cc5b4508646640bd08c50f05f0eb3f2949e756d84d3367f581593",
         intel: "b96c849cc63e0f0218c196be8faba548ed473894fb7fced67311aa39fe97ac21"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
