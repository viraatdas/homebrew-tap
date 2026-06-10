# Moobot Terminal — Mac trading terminal with an AI research desk.
# right-click → Open the first time.
cask "moobot-terminal" do
  version "0.1.0"
  sha256 "7b4b44d4dcde5a1204bf0f3e1446cbe93a65acbd7e2b5cd48913fbf46fce5f8d"

  url "https://github.com/viraatdas/moobot-terminal/releases/download/v#{version}/Moobot.Terminal_#{version}_aarch64.dmg"
  name "Moobot Terminal"
  desc "Mac trading terminal with an AI research desk over Robinhood"
  homepage "https://mooterminal.viraat.dev"

  depends_on arch: :arm64

  app "Moobot Terminal.app"

  zap trash: [
    "~/Library/Application Support/MoobotTerminal",
  ]

  caveats <<~EOS
    Moobot Terminal is not code-signed. If macOS blocks the first launch:
      xattr -dr com.apple.quarantine "/Applications/Moobot Terminal.app"

    The research engine requires Node 22+ and Claude Code with the Robinhood
    MCP connected:
      claude mcp add --transport http robinhood-trading https://agent.robinhood.com/mcp/trading
  EOS
end
