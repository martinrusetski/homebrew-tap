cask "rom-shortcut-maker" do
  version "0.2.0"
  sha256 "7542977195e5505a61fb2795e2b6ad97cdb37f40e8d96c00fd97f2707f065b3c"

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
