class Planck < Formula
  desc "Stand-alone ClojureScript REPL"
  homepage "http://planck-repl.org/"
  url "https://github.com/planck-repl/planck/archive/2.13.0.tar.gz"
  sha256 "aa1e67e90dca742061de725f30492ecc4287e73486aca5a684fdc602a86d7c0e"
  head "https://github.com/planck-repl/planck.git"

  bottle do
    cellar :any
    sha256 "db5fb38a47810381acb9d0de48fe9377ab25ab93313fd2137fcc6e5d31b4828c" => :high_sierra
    sha256 "d83f6153b059ad049d2e3a1d1a61505cec415fc451f884b7cfd9cf7c6eb713f5" => :sierra
    sha256 "7b42ed797321162bff92da08bfc4e8f33e3c23cb3f0e76451cafe488199670bb" => :el_capitan
  end

  depends_on "clojure" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on :xcode => :build
  depends_on "libzip"
  depends_on "icu4c"
  depends_on :macos => :mavericks

  def install
    system "./script/build-sandbox"
    bin.install "planck-c/build/planck"
    bin.install "planck-sh/plk"
  end

  test do
    assert_equal "0", shell_output("#{bin}/planck -e '(- 1 1)'").chomp
  end
end
