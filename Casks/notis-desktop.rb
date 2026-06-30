cask "notis-desktop" do
  version "0.1.2"

  on_arm do
    sha256 "ca173c0416ef72ccf4f21588825a4ae2e66c12bd3b9ded7afdc4ac642ec51b33"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.2/Notis-0.1.2-arm64.dmg"
  end
  on_intel do
    sha256 "915636db14779d73dc11e0087df83f240834ece7855844a961ea6672d739856a"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.2/Notis-0.1.2-x64.dmg"
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
