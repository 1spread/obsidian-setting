#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/1spread/obsidian-setting.git"
SCRIPT_NAME="$(basename "$0")"

# ── カラー出力 ──────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info()    { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# ── Vault パスを決定 ────────────────────────────────────────
if [[ $# -ge 1 ]]; then
  VAULT_PATH="$1"
else
  echo ""
  echo "1spread Obsidian 設定セットアップスクリプト"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
  read -rp "Vault のパスを入力してください（例: ~/Documents/MyVault）: " VAULT_PATH
fi

# チルダを展開
VAULT_PATH="${VAULT_PATH/#\~/$HOME}"
VAULT_PATH="${VAULT_PATH%/}"  # 末尾スラッシュ除去

if [[ -z "$VAULT_PATH" ]]; then
  error "Vault パスが指定されていません。"
  exit 1
fi

OBSIDIAN_DIR="${VAULT_PATH}/.obsidian"

# ── 前提確認 ────────────────────────────────────────────────
if ! command -v git &>/dev/null; then
  error "git がインストールされていません。"
  exit 1
fi

info "Vault パス: ${VAULT_PATH}"

# ── バックアップ処理 ────────────────────────────────────────
if [[ -d "$OBSIDIAN_DIR" ]]; then
  BACKUP_DIR="${OBSIDIAN_DIR}.bak.$(date +%Y%m%d_%H%M%S)"
  warn "既存の .obsidian をバックアップします: ${BACKUP_DIR}"
  mv "$OBSIDIAN_DIR" "$BACKUP_DIR"
  info "バックアップ完了: ${BACKUP_DIR}"
fi

# ── git clone ───────────────────────────────────────────────
info "設定をクローン中..."
git clone --depth 1 "$REPO_URL" "$OBSIDIAN_DIR"

# ── 完了メッセージ ──────────────────────────────────────────
echo ""
echo -e "${GREEN}✓ セットアップ完了！${NC}"
echo ""
echo "  Vault:    ${VAULT_PATH}"
echo "  設定先:   ${OBSIDIAN_DIR}"
echo ""
echo "次のステップ:"
echo "  1. Obsidian を再起動してください（設定の反映に必要）"
echo "  2. 一部プラグイン（translate, excalidraw など）は"
echo "     設定画面から API キーを手動で入力してください"
echo ""
echo "設定の更新:"
echo "  cd \"${OBSIDIAN_DIR}\" && git pull"
echo ""
