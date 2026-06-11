# Moobot Terminal - Mac trading terminal with an AI research desk.
cask "moobot-terminal" do
  version "0.1.9"
  sha256 "56507b34adb3cdd65ed112b54257c2000e11c5591742c3e7665d48fd6111c025"

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
