cask "ps2-manager" do
  version "2.0.0"
  sha256 "032b060d02bc25682f8eef2d5aa4e811e3b06e02a7e826027d48970e6b06e430"

  url "https://github.com/Gionnio/ps2manager/releases/download/v#{version}/PS2Manager_v#{version}.zip"
  name "PS2 Manager"
  desc "Manage backups of your own games on an Open PS2 Loader drive"
  homepage "https://github.com/Gionnio/ps2manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "PS2 Manager.app"

  zap trash: [
    "~/Library/Application Support/PS2 Manager",
    "~/Library/Preferences/com.github.gionnio.PS2Manager.plist",
    "~/Library/Saved Application State/com.github.gionnio.PS2Manager.savedState",
  ]

  caveats <<~EOS
    PS2 Manager is not signed with an Apple Developer ID.
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).
  EOS
end
