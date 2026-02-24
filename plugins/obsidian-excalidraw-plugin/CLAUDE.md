# Excalidraw Plugin - Claude Code ガイド

## .excalidraw.md ファイルの作成方法

Claude CodeからExcalidraw図をプログラム的に作成する手順。

### ファイルフォーマット

```markdown
---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠==


# Excalidraw Data

## Text Elements

## Drawing
```json
{EXCALIDRAW_JSON}
```
%%
```

### 重要ルール

1. **`## Text Elements` セクションは空にする**
   - このセクションにテキストを書くと、JSON側のテキストを上書きし、スタンドアロンテキストがコンテナバウンドテキストに結合されるバグが発生する
   - 空にしておけば、プラグインがJSONから自動生成する

2. **プラグインが自動変換する**
   - 非圧縮 `json` → 圧縮 `compressed-json` に自動変換される
   - よって非圧縮JSONで書いてOK

3. **ラベル付きシェイプは2要素で構成**
   - 親シェイプ: `boundElements: [{"id": "textId", "type": "text"}]`
   - テキスト要素: `containerId: "shapeId"`, `textAlign: "center"`, `verticalAlign: "middle"`
   - この双方向参照が壊れるとテキストが表示されない

4. **全要素に必須フィールド**
   - 共通: type, id, x, y, width, height, angle, strokeColor, backgroundColor, fillStyle, strokeWidth, strokeStyle, roughness, opacity, groupIds, frameId, roundness, seed(一意), version, versionNonce(一意), isDeleted, boundElements, updated, link, locked
   - テキスト追加: text, fontSize, fontFamily(1=Virgil), textAlign, verticalAlign, containerId, originalText, autoResize, lineHeight(1.25)
   - 矢印追加: points, lastCommittedPoint, startBinding, endBinding, startArrowhead, endArrowhead

5. **ファイルは `%%` で終わる**

### Excalidraw MCP ツール

プレビュー生成に利用可能（保存は別途手動で行う）:
- `mcp__excalidraw__read_me` — 要素フォーマットリファレンス（初回のみ）
- `mcp__excalidraw__create_view` — 簡略化されたJSON形式でプレビュー描画
- `mcp__excalidraw__export_to_excalidraw` — excalidraw.comへエクスポート

### 推奨フロー（ハイブリッド方式）

1. `create_view` でプレビュー生成（チャット上でレイアウト確認）
2. ユーザーがObsidian上で手動微調整（位置・サイズ・テキスト）
3. ドキュメントに `![[filename.excalidraw]]` で埋め込み

`create_view` はラフ作成に使い、最終調整はObsidianのExcalidraw VIEWで行う。
JSONを手書きで `.excalidraw.md` に保存する方法は非推奨（位置ずれ・Text Elementsパーサーのバグが発生しやすい）。

### 図解の使い分け

- **Mermaidで十分な場合** → Mermaid（テキストベースで生成しやすい、Obsidianネイティブ対応）
- **手書き風・自由配置が必要な場合** → Excalidraw `create_view` → Obsidianで調整