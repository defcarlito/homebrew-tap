class Surfista < Formula
  desc "Check on your favorite surf spots in your terminal"
  homepage "https://github.com/defcarlito/surfista"
  url "https://github.com/defcarlito/surfista/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "53512efd6c6f1ba3f71c581a0584b548665bb9bc537a8b8d2fcfcbb1ed0b3bb2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
           *std_go_args(ldflags: "-s -w -X main.version=#{version}"),
           "."
  end

  test do
    assert_match "surfista #{version}",
                 shell_output("#{bin}/surfista --version")
  end
end
