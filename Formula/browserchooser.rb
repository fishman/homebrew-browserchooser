class Browserchooser < Formula
  desc "Rofi-style browser picker for Linux, macOS, and Windows"
  homepage "https://github.com/fishman/browserchooser"
  url "https://github.com/fishman/browserchooser/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "84aafb778155d7316007259896c8abf46e5c01d02419b6bae28c5e3b3d494d02"
  license "MIT"
  head "https://github.com/fishman/browserchooser.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", "-mod=vendor", *std_go_args(output: bin/"browserchooser", ldflags: "-s -w")
  end

  test do
    assert_match "Usage", shell_output("#{bin}/browserchooser --help")
  end
end
