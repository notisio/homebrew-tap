cask "notis-desktop" do
  version "0.1.12"

  on_arm do
    sha256 "b9e0b21407260ce3d37126cc99863176cb08af5f2752e232efa028178e517d96"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.12/Notis-0.1.12-arm64.dmg"
  end
  on_intel do
    sha256 "0f359c9b7bf74eac07ed0fe113d9b5f0c77d43073788501dd30f7fa1d9bc87ad"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.12/Notis-0.1.12-x64.dmg"
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
