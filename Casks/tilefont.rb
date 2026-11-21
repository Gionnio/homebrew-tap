cask "tilefont" do
  version "1.0.2"
  sha256 "d6e230947e7f9dee11203173ad21f284194d40422b9dad699fb727f5e6556dd7"

  url "https://github.com/Gionnio/tilefont/releases/download/v#{version}/Tilefont_v#{version}.zip"
  name "Tilefont"
  desc "Turn TrueType and OpenType fonts into GB Studio font images"
  homepage "https://github.com/Gionnio/tilefont"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Tilefont.app"

  uninstall quit: "com.github.gionnio.Tilefont"

  zap trash: [
    "~/Library/Preferences/com.github.gionnio.Tilefont.plist",
    "~/Library/Saved Application State/com.github.gionnio.Tilefont.savedState",
  ]

  caveats <<~EOS
    Tilefont is not signed with an Apple Developer ID.
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).
  EOS
end
