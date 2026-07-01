cask "notis-desktop" do
  version "0.1.15"

  on_arm do
    sha256 "1552a146b571171dc7b5038ca65887f52d8a604cbef4b521af25c5d09ddc43ee"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.15/Notis-0.1.15-arm64.dmg"
  end
  on_intel do
    sha256 "7a2190a3dd583d711663c01130314368ada11775e2e546fc95aea493318b28fc"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.15/Notis-0.1.15-x64.dmg"
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
