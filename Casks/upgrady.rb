cask "upgrady" do
  version "2.0.2"
  sha256 "6caca94077ac8f97d6b48d02e080ab0bf95cecc1c4528d3434b8b1893bbfdccd"

  url "https://github.com/Gionnio/upgrady/releases/download/v#{version}/Upgrady_v#{version}.zip"
  name "Upgrady"
  desc "Keep Sparkle, Homebrew and App Store apps up to date from the menu bar"
  homepage "https://github.com/Gionnio/upgrady"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Upgrady.app"

  uninstall quit: "com.github.gionnio.Upgrady"

  zap trash: [
    "~/Library/Application Support/com.github.gionnio.Upgrady",
    "~/Library/Caches/com.github.gionnio.Upgrady",
    "~/Library/HTTPStorages/com.github.gionnio.Upgrady",
    "~/Library/Preferences/com.github.gionnio.Upgrady.plist",
    "~/Library/Saved Application State/com.github.gionnio.Upgrady.savedState",
  ]

  caveats <<~EOS
    Upgrady is not signed with an Apple Developer ID.
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).
  EOS
end
