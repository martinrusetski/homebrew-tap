cask "local-server-wrapper" do
  version "0.1.1"
  sha256 "95e351725907e3bac8cc32128e9856640064b951e6d03e65db7938ea35e5e998"

  url "https://github.com/martinrusetski/local-server-wrapper/releases/download/v#{version}/LocalServerWrapper-v#{version}.dmg"
  name "Local Server Wrapper"
  desc "Turn local web servers into standalone apps"
  homepage "https://github.com/martinrusetski/local-server-wrapper"

  auto_updates true
  depends_on macos: :ventura

  app "LocalServerWrapper.app"

  # Ad-hoc signed distribution, matching the DMG installation instructions.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/LocalServerWrapper.app"]
  end

  zap trash: [
    "~/Library/Application Support/LocalServerWrapper",
    "~/Library/Frameworks/ServerRuntime.framework",
  ]
end
