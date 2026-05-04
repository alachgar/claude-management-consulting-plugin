#!/usr/bin/env bash
# Build dist/management-consulting.skill for Claude Desktop install.
#
# Format: a plugin-style multi-skill bundle. The ZIP contains a single
# `management-consulting/` folder at root with the plugin manifest and
# `skills/<name>/SKILL.md` for each skill. Claude Desktop unpacks it into
# `~/.claude/skills/management-consulting/` and registers each SKILL.md as
# its own invokable skill (giving you /strategic-analysis, /financial-modeling,
# etc. as individual slash commands), the same way the bundled
# `~/.claude/skills/anthropic-skills/` works.
#
# This replaces the older single-skill dispatcher pattern (one consolidated
# SKILL.md plus references/) which only exposed `/management-consulting` as a
# slash command.
#
# Other install paths (Claude Code, Cowork, Codex, Gemini CLI, npx skills add)
# read this same source layout directly from the repo and don't need a build.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
ZIP="$ROOT/dist/management-consulting.skill"
STAGE="$(mktemp -d)"
BUNDLE="$STAGE/management-consulting"

# Files copied from repo root into the bundle. Anything not here is excluded
# (build script, dist/, .git, etc.).
INCLUDE_FILES=(README.md LICENSE CLAUDE.md)
INCLUDE_DIRS=(.claude-plugin skills)

trap 'rm -rf "$STAGE"' EXIT

mkdir -p "$BUNDLE"

for f in "${INCLUDE_FILES[@]}"; do
  if [[ -f "$ROOT/$f" ]]; then
    cp "$ROOT/$f" "$BUNDLE/$f"
  fi
done

for d in "${INCLUDE_DIRS[@]}"; do
  if [[ -d "$ROOT/$d" ]]; then
    cp -R "$ROOT/$d" "$BUNDLE/"
  fi
done

mkdir -p "$ROOT/dist"
rm -f "$ZIP"
( cd "$STAGE" && zip -qr "$ZIP" management-consulting/ )

skill_count=$(find "$BUNDLE/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
echo "bundled $skill_count skills"
echo "wrote $ZIP ($(wc -c < "$ZIP") bytes)"
echo ""
echo "structure:"
( cd "$STAGE" && find management-consulting -maxdepth 3 -not -path '*/.*' | sort | head -30 )
