cask "notis-desktop" do
  version "0.1.19"

  on_arm do
    sha256 "b2e55b75f75ff4ab724f5a59637fb7d978b3c70f39e35c18b1ef448c3ccc7c3e"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.19/Notis-0.1.19-arm64.dmg"
  end
  on_intel do
    sha256 "14207c848581016927fac5fc42a568f5bf6d9e11d967fbf1171a88c9ed35086f"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.19/Notis-0.1.19-x64.dmg"
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
