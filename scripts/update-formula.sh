#!/bin/sh
# Update the uncov formula with SHA256 checksums from a release
# Usage: ./scripts/update-formula.sh [version]
# Example: ./scripts/update-formula.sh 0.1.0

set -e

VERSION="${1:-}"

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 0.1.0"
    exit 1
fi

REPO="llbbl/uncov"
FORMULA="Formula/uncov.rb"
BASE_URL="https://github.com/${REPO}/releases/download/v${VERSION}"

echo "Updating formula for uncov v${VERSION}..."

# Function to get SHA256 from .sha256 file
get_sha256() {
    platform="$1"
    url="${BASE_URL}/uncov-${platform}.sha256"
    sha256=$(curl -fsSL "$url" 2>/dev/null | awk '{print $1}')
    if [ -z "$sha256" ]; then
        echo "ERROR: Could not fetch SHA256 for ${platform}" >&2
        return 1
    fi
    echo "$sha256"
}

echo "Fetching SHA256 checksums..."

SHA_DARWIN_ARM64=$(get_sha256 "darwin-arm64") || exit 1
echo "  darwin-arm64: ${SHA_DARWIN_ARM64}"

SHA_DARWIN_X64=$(get_sha256 "darwin-x64") || exit 1
echo "  darwin-x64: ${SHA_DARWIN_X64}"

SHA_LINUX_X64=$(get_sha256 "linux-x64") || exit 1
echo "  linux-x64: ${SHA_LINUX_X64}"

echo ""
echo "Updating ${FORMULA}..."

# Update version
sed -i.bak "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA"

# Update SHA256 values
sed -i.bak "s/PLACEHOLDER_SHA256_DARWIN_ARM64/${SHA_DARWIN_ARM64}/" "$FORMULA"
sed -i.bak "s/PLACEHOLDER_SHA256_DARWIN_X64/${SHA_DARWIN_X64}/" "$FORMULA"
sed -i.bak "s/PLACEHOLDER_SHA256_LINUX_X64/${SHA_LINUX_X64}/" "$FORMULA"

# Also update existing SHA256 values (for subsequent updates)
sed -i.bak "s/sha256 \"[a-f0-9]\{64\}\"/sha256 \"${SHA_DARWIN_ARM64}\"/1" "$FORMULA"

# Clean up backup files
rm -f "${FORMULA}.bak"

echo "Done! Formula updated to v${VERSION}"
echo ""
echo "Next steps:"
echo "  1. Review changes: git diff ${FORMULA}"
echo "  2. Commit: git commit -am 'chore: update uncov to v${VERSION}'"
echo "  3. Push: git push"
