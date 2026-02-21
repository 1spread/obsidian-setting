# obsidian-setting

1spread チーム共通の Obsidian 設定リポジトリです。プラグイン・テーマ・ホットキーなどの `.obsidian` 設定を統一管理します。

## Quick Setup（ワンコマンド）

ターミナルで以下を実行するだけでセットアップ完了：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/1spread/obsidian-setting/main/setup.sh)
```

Vault のパスを聞かれるので入力してください。

### Vault パスを引数で渡す場合

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/1spread/obsidian-setting/main/setup.sh) ~/Documents/MyVault
```

### スクリプトの動作

1. Vault パスを確認（引数 or インタラクティブ入力）
2. 既存の `.obsidian` を自動バックアップ（`.obsidian.bak.YYYYMMDD_HHMMSS`）
3. このリポジトリを `.obsidian` としてクローン
4. 完了メッセージを表示

> 実行後は **Obsidian を再起動** してください（設定の反映に必要）

## 設定の更新

リポジトリに新しい設定が追加された場合：

```bash
cd /path/to/vault/.obsidian && git pull
```

## Excluded Files

以下のファイルは API キーや個人設定を含むため除外されています：

- `plugins/obsidian-excalidraw-plugin/data.json` — OpenAI API key
- `plugins/translate/data.json` — DeepL / Google Translate API keys
- `plugins/share-note/data.json` — Service credentials
- `workspace.json` — Personal window layout
- `copilot-index-*.json` — Local search index

これらのプラグインを使用する場合は、各プラグインの設定画面から API キーを手動で入力してください。

## Changelog

### 2026-02-21 - ワンコマンドセットアップ対応
- `setup.sh` を追加（バックアップ機能付きインタラクティブセットアップ）
- README をリポジトリ移転に合わせて更新（igni7e → 1spread）
