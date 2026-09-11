cask "local-server-wrapper" do
  version "0.1.0"
  sha256 "0e7e11c109bb6ea1c4cef882549a756af3926cd54e8e83ff9a5e502d93b02652"

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

  caveats "Requires macOS 13.5 or later."
end
