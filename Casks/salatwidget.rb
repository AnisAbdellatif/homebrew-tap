cask "salatwidget" do
  version "1.1.1"
  sha256 "ff5dac62ff5fc8460a945aa3c6abd8e18f7889b15e19a0b9fb25c30dc4e86107"

  url "https://github.com/AnisAbdellatif/SalatWidget/releases/download/v#{version}/SalatWidget-#{version}.dmg"
  name "SalatWidget"
  desc "Next prayer and countdown in the menu bar, from your mosque's Mawaqit timetable"
  homepage "https://github.com/AnisAbdellatif/SalatWidget"

  depends_on macos: :sonoma

  app "SalatWidget.app"

  # Ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "SalatWidget.app"], base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/SalatWidget",
    "~/Library/Preferences/com.anisabdellatif.SalatWidget.plist",
  ]
end
