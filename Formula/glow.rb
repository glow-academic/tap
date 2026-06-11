class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.25"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.25/glow-aarch64-apple-darwin.tar.gz"
      sha256 "830a0873696d4f169b9f08a7987a113e64f9dec7029b8bb2b2f8d2daa91e8797"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.25/glow-x86_64-apple-darwin.tar.gz"
      sha256 "25a59cdd32266414b780bb3895ab29a91936e80e86ecabb61bf9ec7e911defb6"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.25/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c689e1f4741158afe0ff7ea4583a9c1c1daa93a5b8562e8f63ff6bfe0b828723"

  end

  def install
    bin.install "glow"
    bin.install "glw"
    generate_completions_from_executable(bin/"glow", "completions")
  end

  test do
    assert_match "Glow CLI", shell_output("#{bin}/glow --help")
    assert_match version.to_s, shell_output("#{bin}/glow --version")
  end
end
