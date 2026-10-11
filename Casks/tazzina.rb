cask "tazzina" do
  version "1.0.2"
  sha256 "86281ac79392dbc0cdda80195508060cfd1e9e19ab6708e32fc870bb8a0fc273"

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
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).

    If you installed the closed-lid system service, remove it from
    Tazzina → Settings → Closed Lid before uninstalling.
  EOS
end
