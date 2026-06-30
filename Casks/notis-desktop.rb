cask "notis-desktop" do
  version "0.1.4"

  on_arm do
    sha256 "bca997dc8c541a26ee0153d700ab77bf255b5bedb832d4a34b8b6a7b9a48b221"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.4/Notis-0.1.4-arm64.dmg"
  end
  on_intel do
    sha256 "5bb719d1e554047302e6001c476f2ace431ac56f1a953bc11183ea69497d6335"
    url "https://github.com/notisio/notis-cli/releases/download/desktop-v0.1.4/Notis-0.1.4-x64.dmg"
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
