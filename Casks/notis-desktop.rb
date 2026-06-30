cask "notis-desktop" do
  version "0.1.7"

  on_arm do
    sha256 "82e2b31df51469d4831b7efb4ea10836ea4198b0863e4b39c9f196871aa56b02"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.7/Notis-0.1.7-arm64.dmg"
  end
  on_intel do
    sha256 "22da2f1f2a1599c48c94117ce9a9d497c82219d7f90950d8992d9e0a96977c5d"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.7/Notis-0.1.7-x64.dmg"
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
