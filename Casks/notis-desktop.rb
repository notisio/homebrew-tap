cask "notis-desktop" do
  version "0.1.9"

  on_arm do
    sha256 "a05e14786816a2ef31537ee78435b796e1723a6651eaaec451000fb17a5a1803"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.9/Notis-0.1.9-arm64.dmg"
  end
  on_intel do
    sha256 "fa544d769290bc2cbf970fef8de5c9b4dc0b654a96911e05160842525278839d"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.9/Notis-0.1.9-x64.dmg"
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
