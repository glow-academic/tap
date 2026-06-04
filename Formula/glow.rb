class Glow < Formula
  desc "CLI for the Glow platform — deploy and manage Glow instances"
  homepage "https://github.com/glow-academic/cli"
  version "1.0.17"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glow-academic/cli/releases/download/v1.0.17/glow-aarch64-apple-darwin.tar.gz"
      sha256 "37062ee8aa8e385505bf5ec631ba289dd291ff3fe9ff4e1d72e401c8d4d4b669"
    else
      url "https://github.com/glow-academic/cli/releases/download/v1.0.17/glow-x86_64-apple-darwin.tar.gz"
      sha256 "55decff4c4ebabd91e83d8344e05f8690f3a5d50f66eb46d84d4f6a256a4023c"
    end
  end

  on_linux do

      url "https://github.com/glow-academic/cli/releases/download/v1.0.17/glow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0852d390da00ec9c845f60304b9ed5446ce6dadacfda5cf312e2fa96b7cbdbf8"

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
