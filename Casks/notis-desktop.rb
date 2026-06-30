cask "notis-desktop" do
  version "0.1.11"

  on_arm do
    sha256 "406883684610e039c02823ff6d264b47237de09cb4bdf2fa4710c88a0cb20b8b"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.11/Notis-0.1.11-arm64.dmg"
  end
  on_intel do
    sha256 "0ec126938bf7c028759793f05ae5d530d4bbb55e6dbd6c028af60cf353c892db"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.11/Notis-0.1.11-x64.dmg"
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
