cask "notis-desktop" do
  version "0.1.1"

  on_arm do
    sha256 "8ab77b3db1abc0ff513015ee6f33a1912b04b8d9ffbee6c5e2902ab6cf0e9d83"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.1/Notis-0.1.1-arm64.dmg"
  end
  on_intel do
    sha256 "8d5d71eeda1bfb6b0263f5be2da043bbe27776c1f07468f2f26fb8a9ba5b6b7b"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.1/Notis-0.1.1-x64.dmg"
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
