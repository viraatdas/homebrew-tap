# Moobot Terminal - Mac trading terminal with an AI research desk.
cask "moobot-terminal" do
  version "0.1.7"
  sha256 "8bf00326b6a5d8ee3bacd69f7daecc5ff7bde0126ac8888f5ea6ab50c6a6af2f"

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
