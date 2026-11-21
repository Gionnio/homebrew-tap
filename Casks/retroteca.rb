cask "retroteca" do
  version "0.1.0"
  sha256 "dc3500b5d81fa27ca298a71788c2af9306bf423b137f7aed06a4c6a1b7d8b0ba"

  url "https://github.com/Gionnio/retroteca/releases/download/v#{version}/Retroteca_v#{version}.zip"
  name "Retroteca"
  desc "Build the Switch games you own into native apps"
  homepage "https://github.com/Gionnio/retroteca"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Retroteca.app"

  uninstall quit: "com.github.gionnio.Retroteca"

  zap trash: [
    "~/Library/Application Support/Retroteca",
    "~/Library/Caches/com.github.gionnio.Retroteca",
    "~/Library/HTTPStorages/com.github.gionnio.Retroteca",
    "~/Library/Logs/Retroteca",
    "~/Library/Preferences/com.github.gionnio.Retroteca.plist",
    "~/Library/Saved Application State/com.github.gionnio.Retroteca.savedState",
  ]

  caveats <<~EOS
    Retroteca is not signed with an Apple Developer ID.
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).

    No games, firmware or keys are included: use dumps of the games you own.
  EOS
end
