class Cw < Formula
  desc "Keep your Mac awake with the lid closed while Claude Code works"
  homepage "https://github.com/jeevithreddyofficial/claude-awake"
  url "https://github.com/jeevithreddyofficial/claude-awake/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fec24b48ea5076a402d8bcecf4479c87324768dea14be259f0901f6b8a733381"

  depends_on :macos

  def install
    bin.install "cw"
    bin.install_symlink "cw" => "cw-on"
    bin.install_symlink "cw" => "cw-off"
  end

  def caveats
    <<~EOS
      cw        show whether stay-awake is ON or OFF
      cw-on     turn stay-awake ON and start Claude Code
      cw-off    turn stay-awake OFF

      Needs Claude Code: curl -fsSL https://claude.ai/install.sh | bash
    EOS
  end

  test do
    assert_match "cw:", shell_output("#{bin}/cw")
  end
end
