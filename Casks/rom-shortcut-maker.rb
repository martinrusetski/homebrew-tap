cask "rom-shortcut-maker" do
  version "0.2.0"
  sha256 "7b16a8a6dfa0fdb7738d9b7dd9fd1f074a0b6987e44cf97be38c7f94733666d3"

  url "https://github.com/martinrusetski/rom-shortcut-maker/releases/download/v#{version}/RomShortcutMaker-v#{version}.dmg"
  name "Rom Shortcut Maker"
  desc "Generate native launchers for your ROMs from installed emulators"
  homepage "https://github.com/martinrusetski/rom-shortcut-maker"

  depends_on macos: :tahoe

  app "Rom Shortcut Maker.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Rom Shortcut Maker.app"]
  end

  zap trash: [
    "~/Library/Application Support/RomShortcutMaker",
    "~/Library/Caches/com.romshortcutmaker.app",
    "~/Library/Preferences/com.romshortcutmaker.app.plist",
  ]
end
