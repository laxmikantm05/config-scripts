#!/bin/bash
# ============================================================
#  GNOME dconf Selective Backup Script
#  Backs up: keybindings, media keys, extensions, shell,
#            interface, mutter, peripherals
# ============================================================

BACKUP_DIR="$HOME/.gnome-backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUT="$BACKUP_DIR/gnome-dconf-$TIMESTAMP.dconf"

mkdir -p "$BACKUP_DIR"
> "$OUT"

echo "🔄 Starting GNOME dconf backup..."
echo ""

# ── Sections to back up ─────────────────────────────────────
declare -A SECTIONS
SECTIONS["keybindings"]="/org/gnome/desktop/keybindings/"
SECTIONS["media-keys"]="/org/gnome/settings-daemon/plugins/media-keys/"
SECTIONS["extensions"]="/org/gnome/shell/extensions/"
SECTIONS["shell"]="/org/gnome/shell/"
SECTIONS["interface"]="/org/gnome/desktop/interface/"
SECTIONS["mutter"]="/org/gnome/mutter/"
SECTIONS["peripherals"]="/org/gnome/desktop/peripherals/"

# Preserve a consistent order
ORDER=(keybindings media-keys extensions shell interface mutter peripherals)

# ── Write header ─────────────────────────────────────────────
cat >> "$OUT" <<EOF
# ============================================================
#  GNOME dconf Backup
#  Created : $TIMESTAMP
#  Restore : dconf load <path> < this-file (per section)
#            OR use the companion restore script
# ============================================================

EOF

# ── Dump each section ────────────────────────────────────────
for KEY in "${ORDER[@]}"; do
    PATH_="${SECTIONS[$KEY]}"
    echo -n "  Backing up [$KEY] ($PATH_) ... "

    DUMP=$(dconf dump "$PATH_" 2>/dev/null)

    if [[ -z "$DUMP" ]]; then
        echo "⚠️  empty (skipped)"
        continue
    fi

    {
        echo "# ────────────────────────────────────────────────────"
        echo "# SECTION : $KEY"
        echo "# PATH    : $PATH_"
        echo "# ────────────────────────────────────────────────────"
        echo "$DUMP"
        echo ""
    } >> "$OUT"

    echo "✅ done"
done

# ── Summary ──────────────────────────────────────────────────
SIZE=$(du -sh "$OUT" | cut -f1)
echo ""
echo "============================================================"
echo "  ✅ Backup complete!"
echo "  📄 File : $OUT"
echo "  📦 Size : $SIZE"
echo "============================================================"
echo ""
echo "  To restore a specific section later:"
echo "    dconf load /org/gnome/shell/ < $OUT"
echo ""
