cask "renamy" do
  version "3.0.2"
  sha256 "4a7f6e000f252bcceae4f577db8788eeaabd7e5c5505bbae74413fda55769795"

  url "https://github.com/Gionnio/renamy/releases/download/v#{version}/Renamy_v#{version}.zip"
  name "Renamy"
  desc "Rename and organise a personal video library using TMDB metadata"
  homepage "https://github.com/Gionnio/renamy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Renamy.app"

  zap trash: [
    "~/Library/Containers/com.github.gionnio.Renamy",
    "~/Library/Preferences/com.github.gionnio.Renamy.plist",
    "~/Library/Saved Application State/com.github.gionnio.Renamy.savedState",
  ]

  caveats <<~EOS
    Renamy is not signed with an Apple Developer ID.
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).
  EOS
end
