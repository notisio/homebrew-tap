cask "notis-desktop" do
  version "0.1.3"

  on_arm do
    sha256 "1a7b013096ab9d99ab3ba0ad71c34e6da12c951b1da4d76b0c8c5453b2d011a8"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.3/Notis-0.1.3-arm64.dmg"
  end
  on_intel do
    sha256 "e3500ed04bff3f73d2a6dedcc2b38c27fb8a6349ad9ca1d4ede257ed1e6736ee"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.3/Notis-0.1.3-x64.dmg"
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
