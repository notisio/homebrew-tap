cask "notis-desktop" do
  version "0.1.13"

  on_arm do
    sha256 "0e3b5cb273a432636b37aebdb7085c14f6bd00b2b44b22758aa020bd2b5b1589"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.13/Notis-0.1.13-arm64.dmg"
  end
  on_intel do
    sha256 "8e947a0503a8e875e47645299730b23dc4da167c059b134683375cae7aefae56"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.13/Notis-0.1.13-x64.dmg"
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
