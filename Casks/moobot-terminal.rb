# Moobot Terminal - Mac trading terminal with an AI research desk.
cask "moobot-terminal" do
  version "0.1.6"
  sha256 "478de5e1d1adf68f04635f5849f6c595484e6e3b8bd48e90c2ab584956a963c9"

  url "https://github.com/viraatdas/moobot-terminal/releases/download/v#{version}/Moobot.Terminal_#{version}_aarch64.dmg",
      verified: "github.com/viraatdas/moobot-terminal/"
  name "Moobot Terminal"
  desc "Trading terminal with an AI research desk over Robinhood"
  homepage "https://moobot.viraat.dev/"

  depends_on arch: :arm64
  depends_on :macos

  app "Moobot Terminal.app"

  zap trash: "~/Library/Application Support/MoobotTerminal"

  caveats <<~EOS
    Moobot Terminal is Developer ID signed and notarized.

    Research agents require Node 22+ and either Claude Code or Codex on PATH.
    Robinhood connects inside the app through the official Robinhood MCP OAuth flow.
  EOS
end
