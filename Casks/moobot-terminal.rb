# Moobot Terminal — Mac trading terminal with an AI research desk.
# right-click → Open the first time.
cask "moobot-terminal" do
  version "0.1.3"
  sha256 "17806bcad664ac1431aa8895ca78c84b723f63d462041c57f3b1d46ba059aa3d"

  url "https://github.com/viraatdas/moobot-terminal/releases/download/v#{version}/Moobot.Terminal_#{version}_aarch64.dmg",
      verified: "github.com/viraatdas/moobot-terminal/"
  name "Moobot Terminal"
  desc "Trading terminal with an AI research desk over Robinhood"
  homepage "https://mooterminal.viraat.dev/"

  depends_on arch: :arm64
  depends_on :macos

  app "Moobot Terminal.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Moobot Terminal.app"],
                   sudo: false
  end

  zap trash: "~/Library/Application Support/MoobotTerminal"

  caveats <<~EOS
    Moobot Terminal is ad-hoc signed and not notarized. The cask removes the
    quarantine attribute after install. If macOS still blocks the first launch:
      xattr -dr com.apple.quarantine "/Applications/Moobot Terminal.app"

    The research engine requires Node 22+ and Claude Code with the Robinhood
    MCP connected:
      claude mcp add --transport http robinhood-trading https://agent.robinhood.com/mcp/trading
  EOS
end
