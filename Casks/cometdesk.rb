cask "cometdesk" do
  version "0.1.1"
  sha256 "f57ac3fb94a4c32f3424ac3176fcfd93212c72917a6b06b229ca2e971a61d4de"

  url "https://github.com/AnisAbdellatif/cometdesk/releases/download/v#{version}/CometDesk-#{version}-arm64.dmg"
  name "CometDesk"
  desc "Native macOS console for GL.iNet Comet KVM"
  homepage "https://github.com/AnisAbdellatif/cometdesk"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "CometDesk.app"

  # Ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "CometDesk.app"], base: :appdir
  end

  zap trash: "~/Library/Preferences/rs.cometdesk.console.plist"
end
