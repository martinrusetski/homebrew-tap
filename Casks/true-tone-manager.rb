cask "true-tone-manager" do
  version "0.5.3"
  sha256 "43250329a588733d2594ad228d54ad85806689e7555bba042ae76faf15e4ce25"

  url "https://github.com/martinrusetski/true-tone-manager/releases/download/v0.5.3/TrueToneManager-v0.5.3.dmg"
  name "TrueTone Manager"
  desc "Automatically toggle True Tone per application"
  homepage "https://github.com/martinrusetski/true-tone-manager"

  depends_on macos: :ventura

  app "TrueTone Manager.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/TrueTone Manager.app"]
  end

  zap trash: "~/Library/Application Support/TrueToneManager"
end
