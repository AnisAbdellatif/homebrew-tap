cask "salatwidget" do
  version "1.0.0"
  sha256 "f661e921fcbb0675e53228f7ed83fa489b8308446a6e34b8d73260bbf61fec8f"

  url "https://github.com/AnisAbdellatif/SalatWidget/releases/download/v#{version}/SalatWidget-#{version}.dmg"
  name "SalatWidget"
  desc "Next prayer and countdown in the menu bar, from your mosque's Mawaqit timetable"
  homepage "https://github.com/AnisAbdellatif/SalatWidget"

  depends_on macos: :sonoma

  app "SalatWidget.app"

  # Ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SalatWidget.app"]
  end

  zap trash: [
    "~/Library/Application Support/SalatWidget",
    "~/Library/Preferences/com.anisabdellatif.SalatWidget.plist",
  ]
end
