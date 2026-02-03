# typed: false
# frozen_string_literal: true

class Uncov < Formula
  desc "CLI tool that reports files with low test coverage from Vitest/Istanbul output"
  homepage "https://github.com/llbbl/uncov"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/llbbl/uncov/releases/download/v#{version}/uncov-darwin-arm64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"

      def install
        bin.install "uncov-darwin-arm64" => "uncov"
      end
    end

    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/v#{version}/uncov-darwin-x64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_X64"

      def install
        bin.install "uncov-darwin-x64" => "uncov"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/llbbl/uncov/releases/download/v#{version}/uncov-linux-x64"
      sha256 "PLACEHOLDER_SHA256_LINUX_X64"

      def install
        bin.install "uncov-linux-x64" => "uncov"
      end
    end
  end

  test do
    assert_match "uncov #{version}", shell_output("#{bin}/uncov --version")
  end
end
