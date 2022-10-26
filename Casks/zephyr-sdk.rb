cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.15.1"
  sha256 arm:   "c22e1a12368ad1065e164beb2f0b0f0390e3602e62dcf2aa43c7ee64b4bca4db",
         intel: "1472785bf3d6fbc7f4b03334883a421f1161daf67286d6ca0c4a7ef9c67cfd73"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.gz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
