cask "notis-desktop" do
  version "0.1.8"

  on_arm do
    sha256 "41e0ed24778dbf14f723d0a9b02437d7f8de88e7f48fc73d0e667af8017d9a51"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.8/Notis-0.1.8-arm64.dmg"
  end
  on_intel do
    sha256 "8fa17cca6bb05fbea5f39596e0fa15a7dd64a89535355e0414020eb374fd9805"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.8/Notis-0.1.8-x64.dmg"
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
