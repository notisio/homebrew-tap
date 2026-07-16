cask "notis-desktop" do
  version "0.1.20"

  on_arm do
    sha256 "3a7ff7793e2ac56d5f41f0e46cce6e6fc469fdd5846742540adfa9ecd0506871"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.20/Notis-0.1.20-arm64.dmg"
  end
  on_intel do
    sha256 "e726fe48cfcfd1896c9a0292f9b055bef94f4f1292235e4022d2fa359e6d47f2"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.20/Notis-0.1.20-x64.dmg"
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
