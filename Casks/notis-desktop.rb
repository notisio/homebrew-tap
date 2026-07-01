cask "notis-desktop" do
  version "0.1.17"

  on_arm do
    sha256 "f8d74bcd4e4988583b9004c32349f3160b02386aff17b8097a0b481aedf3b2aa"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.17/Notis-0.1.17-arm64.dmg"
  end
  on_intel do
    sha256 "5c8932da36fdbfcba4411ca259711f021110e5cbbd22037b3bd12ea177587c6b"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.17/Notis-0.1.17-x64.dmg"
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
