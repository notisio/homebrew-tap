cask "notis-desktop" do
  version "0.1.10"

  on_arm do
    sha256 "b94144bf3b218e2358d4aecc559762697e43717c8b6c81729b945e7cc2bea60f"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.10/Notis-0.1.10-arm64.dmg"
  end
  on_intel do
    sha256 "ed6cc9d69e1d88d7d0e79d410b9ab5d5c85438d85eb3f5dece4585583a4f59cb"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.10/Notis-0.1.10-x64.dmg"
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
