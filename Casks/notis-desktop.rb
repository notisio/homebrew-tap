cask "notis-desktop" do
  version "0.1.0"

  on_arm do
    sha256 "c9999b2140851a70b36af14400fd4b5439e3510322b25ee51be9bac7f0fa329f"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.0/Notis-0.1.0-arm64.dmg"
  end
  on_intel do
    sha256 "d0f48d23e184c0d157dd647a213d2db1b606c650b06a2ec97fd138ecb0bb7e5d"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.0/Notis-0.1.0-x64.dmg"
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
