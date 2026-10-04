cask "encody" do
  version "1.0.0"
  sha256 "7802ffabeda398457c6680a902dbc1a089f513dcc4c1ccf0dedc0b6d0c570588"

  url "https://github.com/Gionnio/encody/releases/download/v#{version}/Encody_v#{version}.zip"
  name "Encody"
  desc "Batch video encoder that keeps HDR10, HDR10+ and Dolby Vision"
  homepage "https://github.com/Gionnio/encody"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Encody.app"

  uninstall quit: "com.github.gionnio.Encody"

  zap trash: [
    "~/Library/Application Support/Encody",
    "~/Library/Caches/Encody",
    "~/Library/Preferences/com.github.gionnio.Encody.plist",
    "~/Library/Saved Application State/com.github.gionnio.Encody.savedState",
  ]

  caveats <<~EOS
    Encody needs FFmpeg 7.1 or later (see the README for the recommended build).
    Encody is not signed with an Apple Developer ID.
    If macOS blocks the first launch, allow it in
    System Settings → Privacy & Security → Open Anyway.
  EOS
end
