cask "encody" do
  version "1.0.1"
  sha256 "86aac24d5b9d606c6972ba8a585c5f2273275d3e9c70cbf9b90001550503091c"

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
