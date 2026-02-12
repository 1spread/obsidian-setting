# obsidian-daisuke-setting

Obsidian の `.obsidian` 設定ディレクトリのバックアップリポジトリです。

## Source

```
/Users/das/Documents/mac-obsidian/.obsidian
```

## Install

既存の Obsidian Vault に適用する場合：

```bash
# Vault の .obsidian ディレクトリをバックアップ
mv /path/to/vault/.obsidian /path/to/vault/.obsidian.bak

# このリポジトリをクローン
git clone https://github.com/igni7e/obsidian-daisuke-setting.git /path/to/vault/.obsidian

# Obsidian を再起動
```

## Excluded Files

以下のファイルはAPIキーや個人設定を含むため除外されています：

- `plugins/obsidian-excalidraw-plugin/data.json` — OpenAI API key
- `plugins/translate/data.json` — DeepL / Google Translate API keys
- `plugins/share-note/data.json` — Service credentials
- `workspace.json` — Personal window layout
- `copilot-index-*.json` — Local search index
