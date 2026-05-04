#!/usr/bin/env bash
# Build dist/management-consulting.skill for Claude Desktop install.
#
# Claude Desktop's "Upload skill" UI takes one skill folder per upload, so we
# consolidate all 15 consulting skills into a single skill named
# `management-consulting`. The hand-curated dispatcher at
# dist/build/management-consulting/SKILL.md tells Claude which reference file
# to load for each topic. This script regenerates those reference files from
# skills/<name>/SKILL.md (frontmatter stripped) and re-zips everything.
#
# Other install paths (Claude Code, Cowork, Codex, Gemini CLI, npx skills add)
# read skills/<name>/SKILL.md directly and don't need this artifact.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/skills"
STAGE="$ROOT/dist/build/management-consulting"
REFS="$STAGE/references"
ZIP="$ROOT/dist/management-consulting.skill"

# writing-style is shipped as a standalone skill for npx installs but its content
# is already inlined in the dispatcher SKILL.md, so we don't duplicate it here.
SKIP=(writing-style)

if [[ ! -f "$STAGE/SKILL.md" ]]; then
  echo "missing dispatcher at $STAGE/SKILL.md" >&2
  exit 1
fi

rm -rf "$REFS"
mkdir -p "$REFS"

skipped=()
generated=()
copied=()

for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  if printf '%s\n' "${SKIP[@]}" | grep -qx "$name"; then
    skipped+=("$name")
    continue
  fi
  src="$dir/SKILL.md"
  if [[ ! -f "$src" ]]; then
    echo "skip: $name has no SKILL.md" >&2
    continue
  fi
  # Strip only the first frontmatter block (between the first two --- lines).
  # Preserves --- section separators inside the body.
  awk 'n<2 { if(/^---$/) n++; next } 1' "$src" > "$REFS/$name.md"
  generated+=("$name")
  # Copy any sub-references this skill ships (e.g. client-deliverables/references/pptx-generation.md)
  if [[ -d "$dir/references" ]]; then
    for sub in "$dir/references"/*.md; do
      [[ -e "$sub" ]] || continue
      cp "$sub" "$REFS/"
      copied+=("$(basename "$sub")")
    done
  fi
done

rm -f "$ZIP"
( cd "$ROOT/dist/build" && zip -qr "$ZIP" management-consulting/ )

echo "generated references (${#generated[@]}): ${generated[*]}"
echo "copied sub-references (${#copied[@]}): ${copied[*]}"
echo "skipped (${#skipped[@]}): ${skipped[*]}"
echo "wrote $ZIP ($(wc -c < "$ZIP") bytes)"
