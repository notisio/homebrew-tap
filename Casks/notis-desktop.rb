cask "notis-desktop" do
  version "0.1.6"

  on_arm do
    sha256 "35d848cf7044607f1ce0900f585a1290cea4f77106ac981b7b56bd2e942b6ea2"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.6/Notis-0.1.6-arm64.dmg"
  end
  on_intel do
    sha256 "1bf493d8a5cdff871386a2124e84466a5b704a722eff53d6bcf94389336d4846"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.6/Notis-0.1.6-x64.dmg"
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
