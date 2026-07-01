cask "notis-desktop" do
  version "0.1.16"

  on_arm do
    sha256 "fb671143b9f0b323fc2258a9f700a4dff8f665c8b605c31b9608c450fd30c462"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.16/Notis-0.1.16-arm64.dmg"
  end
  on_intel do
    sha256 "27cc5b44c08a6d5a73a7b4f78eb81b05b32897a1b4ca2a991d30c5ff4f6546ff"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.16/Notis-0.1.16-x64.dmg"
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
