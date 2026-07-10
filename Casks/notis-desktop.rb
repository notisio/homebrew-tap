cask "notis-desktop" do
  version "0.1.18"

  on_arm do
    sha256 "4085f923c813cbd1478f5f1c48505bc4513c93d0170c6f2413943cec2f3ae43d"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.18/Notis-0.1.18-arm64.dmg"
  end
  on_intel do
    sha256 "c576a0b8f9c6d44396a95f314af7dc667727fe8b4a10d6bc8f1c81b92823e65d"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.18/Notis-0.1.18-x64.dmg"
  end

  name "Notis"
  desc "Notis menubar app — AI egress protection for your dev machine"
  homepage "https://notis.io"

  app "Notis.app"

  # Unsigned beta: strip the quarantine flag so Gatekeeper opens it cleanly.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Notis.app"]
  end

  zap trash: [
    "~/Library/Application Support/Notis",
    "~/Library/Preferences/io.notis.desktop.plist",
    "~/Library/Logs/Notis",
  ]
end
