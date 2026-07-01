cask "notis-desktop" do
  version "0.1.14"

  on_arm do
    sha256 "8fe46b1c36e44c8bb2ad33f6ae7935a03cb996cb6b659a8a9939920cfd56dcfa"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.14/Notis-0.1.14-arm64.dmg"
  end
  on_intel do
    sha256 "a0f3af6dedeacf50e1f415e06df9a2bad2a7b407e04e3f542dc2e77e242ff444"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.14/Notis-0.1.14-x64.dmg"
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
