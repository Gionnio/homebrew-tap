cask "tazzina" do
  version "1.0.0"
  sha256 "31a0c34e83fc108b4114efe63b4ac01912443e4b1ce44680aa0f12a02995acd1"

  url "https://github.com/Gionnio/tazzina/releases/download/v#{version}/Tazzina_v#{version}.zip"
  name "Tazzina"
  desc "Menu bar utility to prevent sleep, with triggers and sounds"
  homepage "https://github.com/Gionnio/tazzina"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Tazzina.app"

  uninstall quit: "com.github.gionnio.Tazzina"

  zap trash: [
    "/Library/Application Support/Tazzina",
    "~/Library/Preferences/com.github.gionnio.Tazzina.plist",
  ]

  caveats <<~EOS
    Tazzina is not signed with an Apple Developer ID.
    If macOS blocks the first launch, right-click the app and choose Open,
    or allow it in System Settings → Privacy & Security.

    If you installed the closed-lid system service, remove it from
    Tazzina → Settings → Closed Lid before uninstalling.
  EOS
end
