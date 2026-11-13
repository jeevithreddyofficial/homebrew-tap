class Cw < Formula
  desc "Keep your Mac awake with the lid closed while Claude Code works"
  homepage "https://github.com/jeevithreddyofficial/claude-awake"
  url "https://github.com/jeevithreddyofficial/claude-awake/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "73f6bfe9e5244344025f04473808602fc5376fb659c6f19ed3b2cb31db7bd457"

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

      The first cw-on asks for your Mac password once (cw --setup),
      then never again. Undo with: cw --unsetup

      Needs Claude Code: curl -fsSL https://claude.ai/install.sh | bash
    EOS
  end

  test do
    assert_match "cw:", shell_output("#{bin}/cw")
  end
end
