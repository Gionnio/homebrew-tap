cask "encody" do
  version "1.2.1"
  sha256 "f3f44d9ec530a3de401577e414b3ef531bd1ddde7fa4edec9f9315205d5cb2c8"

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
    If macOS blocks the first launch, open System Settings → Privacy & Security
    and click Open Anyway (right-click → Open no longer works on macOS 15 or later).
  EOS
end
