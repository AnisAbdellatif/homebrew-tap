cask "parabole" do
  version "0.2.0"
  sha256 "c8601cf2c06c251fcb2bffd4219d860648924f7de7f425b949b3342655f203df"

  url "https://github.com/AnisAbdellatif/parabole/releases/download/v#{version}/Parabole-#{version}-macos-arm64.dmg"
  name "Parabole"
  desc "IPTV player for M3U playlists and Xtream sources, playing through mpv"
  homepage "https://github.com/AnisAbdellatif/parabole"

  depends_on arch: :arm64
  depends_on :macos

  app "Parabole.app"

  # Ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Parabole.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.parabole.Parabole",
    "~/Library/Caches/dev.parabole.Parabole",
  ]
end
