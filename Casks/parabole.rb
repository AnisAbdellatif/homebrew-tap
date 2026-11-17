cask "parabole" do
  version "0.2.1"
  sha256 "ddaf951216938a21900ee9d3502ee4624c8ff47e2c47ec46fb9d55c02bd662e4"

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
