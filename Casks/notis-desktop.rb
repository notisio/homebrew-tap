cask "notis-desktop" do
  version "0.1.5"

  on_arm do
    sha256 "2decafe240ea824e99259ffb3fe599d273ac07b021b6eea7b6c689fb6bda18b4"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.5/Notis-0.1.5-arm64.dmg"
  end
  on_intel do
    sha256 "82ad28f6983dcbd320b159ea0c12b3e2906a517f1ed6ae44633aceb3fc04e56c"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.5/Notis-0.1.5-x64.dmg"
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
