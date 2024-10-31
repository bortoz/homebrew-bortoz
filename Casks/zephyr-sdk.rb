cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.17.0"
  sha256 arm:   "38915d70add49715d489e3efade43e0d40c7182f551a620cc5a1db8eca03af9e",
         intel: "83bd15d2ee0dc49c7dc043e1422b7b58531d6f76c5d7d156227d795b543331c5"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.xz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
