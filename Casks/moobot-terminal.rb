# Moobot Terminal — Mac trading terminal with an AI research desk.
# right-click → Open the first time.
cask "moobot-terminal" do
  version "0.1.4"
  sha256 "de1c708227d6dc9840695112d8b2bc232fd507ee190c6935943d905b59cd0a57"

  url "https://github.com/viraatdas/moobot-terminal/releases/download/v#{version}/Moobot.Terminal_#{version}_aarch64.dmg",
      verified: "github.com/viraatdas/moobot-terminal/"
  name "Moobot Terminal"
  desc "Trading terminal with an AI research desk over Robinhood"
  homepage "https://mooterminal.viraat.dev/"

  depends_on arch: :arm64
  depends_on :macos

  app "Moobot Terminal.app"

  zap trash: "~/Library/Application Support/MoobotTerminal"

  caveats <<~EOS
    The research engine requires Node 22+ and Claude Code with the Robinhood
    MCP connected:
      claude mcp add --transport http robinhood-trading https://agent.robinhood.com/mcp/trading
  EOS
end
