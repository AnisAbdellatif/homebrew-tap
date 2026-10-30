cask "cometdesk" do
  version "0.1.0"
  sha256 "7fa2a5f9459d80ee5d5d16ac072b273108a5122cdbda35f1e7f72f521264482d"

  url "https://github.com/AnisAbdellatif/homebrew-tap/releases/download/cometdesk-v#{version}/CometDesk-#{version}-arm64.dmg"
  name "CometDesk"
  desc "Native macOS console for GL.iNet Comet KVM"
  homepage "https://github.com/AnisAbdellatif/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "CometDesk.app"

  # Ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CometDesk.app"]
  end

  zap trash: "~/Library/Preferences/rs.cometdesk.console.plist"
end
