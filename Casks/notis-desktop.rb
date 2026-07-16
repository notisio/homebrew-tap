cask "notis-desktop" do
  version "0.1.21"

  on_arm do
    sha256 "fa9ba7d5750c0e3ede7762d47e6acdf73976d5a503d5a5ff381968ee27da92ef"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.21/Notis-0.1.21-arm64.dmg"
  end
  on_intel do
    sha256 "ba43773251e550b60543a3c01fe474c168972c83cdc8cfcf2df3786bf7297077"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.21/Notis-0.1.21-x64.dmg"
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
