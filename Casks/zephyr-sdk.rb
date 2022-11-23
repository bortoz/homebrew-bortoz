cask "zephyr-sdk" do
  arch arm:   "aarch64",
       intel: "x86_64"

  version "0.15.2"
  sha256 arm:   "847ba3d83767389fbbf262f14f06baf857f4baf04c739edebd72601c4cc2bc80",
         intel: "326d79577ff7660fdf05743a07dab6cfc01fafe5e571aced89a35c392a386238"

  url "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v#{version}/zephyr-sdk-#{version}_macos-#{arch}.tar.gz",
      verified: "github.com/zephyrproject-rtos/sdk-ng/"
  name "Zephyr SDK"
  desc "Zephyr Software Development Kit"
  homepage "https://docs.zephyrproject.org/latest/develop/toolchains/zephyr_sdk.html"

  stage_only true
end
