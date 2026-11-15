cask "parabole" do
  version "0.1.1"
  sha256 "696ba4d552a56e723b5978c0ed75bdd87cce431103fdf8af616f27a29617798b"

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
