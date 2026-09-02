# Homebrew formula for zz editor, installing prebuilt binaries.
#
# zz has no cgo dependency, so the release archives are static
# (CGO_ENABLED=0) and cross-compiled for darwin/linux on amd64/arm64. They are
# installed as-is rather than built from source: there is nothing to configure
# at build time, and a 5 MB download beats pulling a Go toolchain.
#
# The macOS binaries carry the Go linker's ad-hoc signature, which is all
# macOS needs to run a local binary. Homebrew fetches with curl, so no
# quarantine attribute is set and Gatekeeper stays out of the way.
#
# `brew install --HEAD viraatdas/tap/zz` builds master from source instead,
# which is the only path that needs Go.
class Zz < Formula
  desc "Very simplistic, non-AI terminal text editor with vim keybindings"
  homepage "https://github.com/viraatdas/zz-editor"
  license "MIT"

  head do
    url "https://github.com/viraatdas/zz-editor.git", branch: "master"
    depends_on "go" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/viraatdas/zz-editor/releases/download/v0.1.7/zz-0.1.7-darwin-arm64.tar.gz"
      sha256 "abf702b75086cf6d4fc2d624842a142ddc591c8b54d06b70e0b6cfe1bf5d2518"
    end
    on_intel do
      url "https://github.com/viraatdas/zz-editor/releases/download/v0.1.7/zz-0.1.7-darwin-amd64.tar.gz"
      sha256 "65f68632d4d2c39293446560b2000ed336f28697ee557504bd84916798639e8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viraatdas/zz-editor/releases/download/v0.1.7/zz-0.1.7-linux-arm64.tar.gz"
      sha256 "e9e40c08ca4034c7c48dfb424b1dffe4ba0edc9d7944e482e477a3faf2729330"
    end
    on_intel do
      url "https://github.com/viraatdas/zz-editor/releases/download/v0.1.7/zz-0.1.7-linux-amd64.tar.gz"
      sha256 "7467525a6f1e6a4f9b47276d9b4ffecd337fb4e250c0c931075f4f3f72cce251"
    end
  end

  def install
    if build.head?
      system "make", "build"
      bin.install "zz"
      man1.install "assets/packaging/zz.1"
    else
      bin.install "zz"
      man1.install "zz.1"
    end
  end

  def caveats
    <<~EOS
      zz opens in vim normal mode. Press `i` to type, `Esc` to come back.

        h j k l   move            dd   cut line
        i a o O   insert          yy p paste
        gg G      top / bottom    u    undo
        /         search          :    command bar (:w :q :wq :42)

      Ctrl-s, Ctrl-q and the rest of micro's bindings work in both modes.
      Run `zz` then Ctrl-g for the full help, or `> set modal false` to turn
      modal editing off entirely.

      Configuration lives in ~/.config/zz.
    EOS
  end

  test do
    assert_match "Version: #{version}", shell_output("#{bin}/zz -version")

    # Prove this is zz and not stock micro: modal editing is on by default and
    # the default colorscheme is `simple`. Driving a real edit would need a
    # pty, which is too flaky for a formula test; the editor itself is covered
    # by the test suite upstream.
    options = shell_output("#{bin}/zz -options")
    assert_match(/-modal value\s*\n\s*Default value: 'true'/, options)
    assert_match(/-colorscheme value\s*\n\s*Default value: 'simple'/, options)
  end
end
