cask "retroteca" do
  version "0.2.6"
  sha256 "2964345b2a7119a7ce5fd4dc20017073e01e9e683d56ef4977dada8d16148027"

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
