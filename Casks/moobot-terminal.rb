# Moobot Terminal — Mac trading terminal with an AI research desk.
# right-click → Open the first time.
cask "moobot-terminal" do
  version "0.1.0"
  sha256 "26c4e7c513a3b478410208cec7983c848aecddd8746400422f19bb34b1eeb34d"

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
