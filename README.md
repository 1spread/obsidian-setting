# obsidian-daisuke-setting

IGNITE チーム共通の Obsidian 設定リポジトリです。プラグイン・テーマ・ホットキーなどの `.obsidian` 設定を統一管理します。

## Quick Setup（ワンコマンド）

既存の Vault に設定を適用する場合：

```bash
rm -rf /path/to/vault/.obsidian && git clone https://github.com/igni7e/obsidian-daisuke-setting.git /path/to/vault/.obsidian
```

> `/path/to/vault` を実際の Vault パスに置き換えてください。

### 新規 Vault の場合

1. Obsidian で新しい Vault を作成する
2. Obsidian を閉じる
3. 上記のワンコマンドを実行する
4. Obsidian を再度開く

### 注意事項

- 実行後は **Obsidian を再起動** してください（設定の反映に必要）
- 一部プラグインは初回起動時に **API キーの設定が必要** です（下記「除外ファイル」参照）

## 設定の更新

リポジトリに新しい設定が追加された場合：

```bash
cd /path/to/vault/.obsidian && git pull
```

更新後も Obsidian の再起動が必要です。

## Excluded Files

以下のファイルは API キーや個人設定を含むため除外されています：

- `plugins/obsidian-excalidraw-plugin/data.json` — OpenAI API key
- `plugins/translate/data.json` — DeepL / Google Translate API keys
- `plugins/share-note/data.json` — Service credentials
- `workspace.json` — Personal window layout
- `copilot-index-*.json` — Local search index

これらのプラグインを使用する場合は、各プラグインの設定画面から API キーを手動で入力してください。
